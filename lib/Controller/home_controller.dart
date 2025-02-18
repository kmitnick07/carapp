import 'package:apna_wash/Utils/Custom/custom_dailog.dart';
import 'package:dev_print/dev_print.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/WorkOrder/work_order_model.dart';
import '../Services/api_const.dart';
import '../Services/api_provider.dart';

class HomeController extends GetxController {
  var workOrders = <WorkOrder>[].obs;
  var isLoading = false.obs;
  var isLastPage = false.obs;
  var currentPage = 1.obs;
  String phoneNumber = '';
  final int pageSize = 10;
  final String baseUrl =
      'https://apnawash.azurewebsites.net/api/GetAllWorkOrderForUser';
  var hasShownGreeting = false
      .obs; // New flag to track greeting display  User? currentUser = FirebaseAuth.instance.currentUser;
  User? currentUser = FirebaseAuth.instance.currentUser;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    phoneNumber = kDebugMode ? '9898232801' : currentUser?.phoneNumber ?? '';
    fetchWorkOrders();
    checkAndShowGreeting();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  void _scrollListener() {
    if (!isLoading.value &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100) {
      fetchWorkOrders(isLoadMore: true);
    }
  }

  void fetchWorkOrders({bool isLoadMore = false}) async {
    if (isLoading.value || isLastPage.value) {
      return; // Prevent duplicate requests if already loading
    }
    String apiEndpoint = 'GetAllWorkOrderForUser';

    String url =
        '${ApiConst.baseUrl}$apiEndpoint?PageNumber=$currentPage&PageSize=$pageSize&PhoneNumber=$phoneNumber';

    isLoading.value = true;
    try {
      final response =
          await ApiProvider().httpMethod(method: HttpMethod.get, url: url);

      if (response['success']) {
        final workOrdersData = response['result']['workOrders'];
        final workOrdersMap = (workOrdersData as List<dynamic>)
            .map((e) => WorkOrder.fromMap(e))
            .toList();
        workOrders.addAll(workOrdersMap);
        currentPage++;
        isLastPage.value =
            (response['result']['isLastPage'] ?? 'Yes') == 'Yes' ? true : false;
      }
    } catch (e) {
      devPrint(e, tag: "Error");
    } finally {
      isLoading.value = false;
    }
  }

  void checkAndShowGreeting() async {
    final prefs = await SharedPreferences.getInstance();
    final hasShownGreeting = prefs.getBool('hasShownGreeting') ?? false;
    if (!hasShownGreeting) {
      await prefs.setBool('hasShownGreeting', true);
      showGreeting();
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
      // Navigation.pushNamed(Routes.kLoginScreen);
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout: $e');
    }
  }
}
