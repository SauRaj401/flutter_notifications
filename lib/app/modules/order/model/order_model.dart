class OrderModel {
  final int id;
  final String item_name;
  final String status;

  OrderModel({required this.id, required this.item_name, required this.status});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      item_name: json['item_name'],
      status: json['status'],
    );
  }
}
