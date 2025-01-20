import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socket_new/app/modules/order/views/orderscreen.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return OrderScreen();
  }
}
