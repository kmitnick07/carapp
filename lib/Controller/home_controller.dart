import 'dart:convert';
import 'package:apna_wash/Routes/route_name.dart';
import 'package:apna_wash/Utils/Custom/custom_dailog.dart';
import 'package:dev_print/dev_print.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/work_order_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var workOrders = <WorkOrder>[].obs;
  var isLoading = false.obs;
  var isLastPage = false.obs;
  var currentPage = 1.obs;
  final int pageSize = 10;
  final String baseUrl = 'https://apnawash.azurewebsites.net/api/GetAllWorkOrderForUser';
  var hasShownGreeting = false.obs; // New flag to track greeting display

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    fetchWorkOrders();
    showGreeting();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  void _scrollListener() {
    if (!isLoading.value && scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
      fetchWorkOrders(isLoadMore: true);
    }
  }

  void fetchWorkOrders({bool isLoadMore = false}) async {
    final user = FirebaseAuth.instance.currentUser;
    String phoneNumber = '';

    // Get the phone number of the user
    if (user != null && user.phoneNumber != null) {
      phoneNumber = kDebugMode ? '9898232801' : user.phoneNumber ?? '';
      devPrint('Phone Number: $phoneNumber');
    } else {
      devPrint('No phone number available');
    }

    // Prevent duplicate requests if already loading
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      // Calculate the current page number to fetch
      final int page = isLoadMore ? currentPage.value + 1 : 1;
      final String url = '$baseUrl?PageNumber=$page&PageSize=$pageSize&PhoneNumber=$phoneNumber';

      final response = await http.get(Uri.parse(url));

      // If the response is successful
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> data = responseData['result']['workOrders'] ?? [];

        devPrint(responseData['result']['isLastPage'], tag: "013527");

        // Check if it's the last page
        isLastPage.value = responseData['result']['isLastPage'] == 'Yes' ? true : false;
        devPrint(isLastPage.value ? 'Last Page' : 'Not Last Page');
        if (isLastPage.value) {
          devPrint('No more data available. This is the last page.');
          return; // Exit the function if it's the last page
        }

        if (data.isNotEmpty) {
          final List<WorkOrder> newWorkOrders = data.map((e) => WorkOrder.fromJson(e)).toList();

          if (isLoadMore) {
            workOrders.addAll(newWorkOrders);
            currentPage.value = page;
          } else {
            workOrders.value = newWorkOrders;
            currentPage.value = 1;
          }
        } else if (!isLoadMore) {
          workOrders.clear();
        }
      } else {
        print('Failed to fetch work orders: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching work orders: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void showGreeting() {
    if (!hasShownGreeting.value) {
      hasShownGreeting.value = true;
      Future.delayed(Duration.zero, () {
        CustomDialogs.customDialog(
            content: 'Welcome to APNA WASH - Auto Care',
            buttonCount: 1,
            positiveText: 'Thank You',
            onTapPositive: () {
              Get.back();
            });

        // Get.dialog(
        //   AlertDialog(
        //     title: const Text('Welcome!'),
        //     content: const Text('Welcome to APNA WASH - Auto Care'),
        //     actions: [
        //       TextButton(
        //         onPressed: () => Get.back(),
        //         child: const Text('OK'),
        //       ),
        //     ],
        //   ),
        // );
      });
    }
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigateTo(RouteNames.kLoginScreen);
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout: $e');
    }
  }
}
