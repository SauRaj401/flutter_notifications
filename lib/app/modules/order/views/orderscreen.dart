import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';

class OrderScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: Obx(() {
        if (orderController.orders.isEmpty) {
          return Center(child: Text('No orders yet.'));
        }
        return ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            final order = orderController.orders[index];
            return ListTile(
              title: Text(order.item_name),
              subtitle: Text('Status: ${order.status}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.check, color: Colors.green),
                  //   onPressed: () => updateOrderStatus(order.id, 'accepted'),
                  // ),
                  // IconButton(
                  //   icon: Icon(Icons.close, color: Colors.red),
                  //   onPressed: () => updateOrderStatus(order.id, 'rejected'),
                  // ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  // void updateOrderStatus(int orderId, String status) {
  //   orderController.socketService.socket.emit('update_order_status', {
  //     'orderId': orderId,
  //     'status': status,
  //   });
  // }
}
