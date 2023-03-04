import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.id,
    required this.userId,
    required this.receiverId,
    required this.orderId,
    required this.partyName,
    required this.shippingAddress,
    required this.panNumber,
    required this.mobileNumber,
    required this.loadingType,
    required this.productName,
    required this.grade,
    required this.size,
    required this.qty,
  });

  String id;
  String userId;
  String receiverId;
  String orderId;
  String partyName;
  String shippingAddress;
  String panNumber;
  String mobileNumber;
  String loadingType;
  String productName;
  String grade;
  String size;
  String qty;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    receiverId: json["receiver_id"],
    orderId: json["order_id"],
    partyName: json["partyName"],
    shippingAddress: json["shippingAddress"],
    panNumber: json["panNumber"],
    mobileNumber: json["mobileNumber"],
    loadingType: json["loadingType"],
    productName: json["product_name"],
    grade: json["grade"],
    size: json["size"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "receiver_id": receiverId,
    "order_id": orderId,
    "partyName": partyName,
    "shippingAddress": shippingAddress,
    "panNumber": panNumber,
    "mobileNumber": mobileNumber,
    "loadingType": loadingType,
    "product_name": productName,
    "grade": grade,
    "size": size,
    "qty": qty,
  };
}