import 'package:apna_wash/Utils/Custom/custom_dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              CustomDialogs.customDialog(
                  content: 'Are you sure you want to logout?',
                  buttonCount: 2,
                  onTapPositive: () {
                    Get.back();
                    controller.logout();
                  });
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.workOrders.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.workOrders.isEmpty) {
          return const Center(child: Text('No work orders found.'));
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.fetchWorkOrders(isLoadMore: false);
          },
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.workOrders.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.workOrders.length) {
                final workOrder = controller.workOrders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Vehicle: ${workOrder.vehicleMake ?? 'N/A'} ${workOrder.vehicleModel ?? ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Vehicle No: ${workOrder.vehicleNumber ?? 'N/A'}'),
                        Text('Status: ${workOrder.woCurrentStatus ?? 'No Status'}'),
                        Text('Invoice: ${workOrder.woInvoiceNo ?? 'N/A'}'),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Work Order Details'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Work Order ID: ${workOrder.workOrderId ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Created Date: ${workOrder.woCreatedDate ?? 'N/A'}'),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Invoice No: ${workOrder.woInvoiceNo ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Status: ${workOrder.woCurrentStatus ?? 'No Status'}'),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Customer Name: ${workOrder.customerName ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Phone Number: ${workOrder.customerPhoneNumber ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Verified Customer: ${workOrder.verifiedCustomer ?? 'N/A'}'),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Vehicle Number: ${workOrder.vehicleNumber ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Vehicle Make: ${workOrder.vehicleMake ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Vehicle Model: ${workOrder.vehicleModel ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Fuel Type: ${workOrder.vehicleFuelType ?? 'N/A'}'),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Branch Name: ${workOrder.branchName ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Business Trade Name: ${workOrder.businessTradeName ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Business GSTIN: ${workOrder.businessGSTINNumber ?? 'N/A'}'),
                                ),
                                const Divider(),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Billing Details:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Subtotal: ₹${workOrder.subTotal.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Discount: ₹${workOrder.discount.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Other Discount: ₹${workOrder.otherDiscount.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Total GST Amount: ₹${workOrder.totalGSTAmount.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Total Amount: ₹${workOrder.totalAmount.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Total Paid Amount: ₹${workOrder.totalPaidAmount.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text('Total Due Amount: ₹${workOrder.totalDueAmount.toString() ?? 'N/A'}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text(
                                      'Return Change Amount: ₹${workOrder.returnChangeAmount.toString() ?? 'N/A'}'),
                                ),
                                const Divider(),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Items:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                if (workOrder.woItems != null && workOrder.woItems!.isNotEmpty)
                                  ...workOrder.woItems!.map((item) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 12.0),
                                      child: Text('- ${item.itemName} (Qty: ${item.quantity}, ₹${item.totalAmount})'),
                                    );
                                  }).toList()
                                else
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 12.0),
                                    child: Text('No items available.'),
                                  ),
                                const Divider(),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Payments:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                if (workOrder.woPayments != null && workOrder.woPayments!.isNotEmpty)
                                  ...workOrder.woPayments!.map((payment) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 12.0),
                                      child: Text('- ₹${payment.paymentAmt} (${payment.paymentMethod})'),
                                    );
                                  }).toList()
                                else
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 12.0),
                                    child: Text('No payment details available.'),
                                  ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                if (controller.isLoading.value && !controller.isLastPage.value) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (controller.isLastPage.value) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: Text('No further data found.')),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
          ),
        );
      }),
    );
  }
}
