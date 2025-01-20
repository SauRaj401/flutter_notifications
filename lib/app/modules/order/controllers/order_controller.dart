import 'package:get/get.dart';
import '../../services/notification_service.dart';
import '../../services/socket_service.dart';
import '../model/order_model.dart';

class OrderController extends GetxController {
  var orders = <OrderModel>[].obs;
  final SocketService socketService = SocketService();

  final NotificationService notificationService = NotificationService();

  @override
  void onInit() {
    super.onInit();
    notificationService.initNotification();
    socketService.connectToSocket();

    // Listen for new orders
    socketService.socket.on('new_order', (data) {
      var newOrder = OrderModel.fromJson(data);
      orders.add(newOrder);

      // Show local notification for new order
      notificationService.showNotification(
        id: newOrder.id, // Use a unique ID for each notification
        title: 'New Order Received!',
        body: 'Order #${newOrder.id} has been placed.',
      );
    });

    // Listen for order status updates
    socketService.socket.on('order_status_updated', (data) {
      var updatedOrder = OrderModel.fromJson(data);
      int index = orders.indexWhere((order) => order.id == updatedOrder.id);
      if (index != -1) {
        orders[index] = updatedOrder;

        // Show local notification for order status update
        notificationService.showNotification(
          id: updatedOrder.id,
          title: 'Order Status Updated',
          body: 'Order #${updatedOrder.id} is now ${updatedOrder.status}.',
        );
      }
    });
  }

  @override
  void onClose() {
    socketService.disconnect();
    super.onClose();
  }
}
