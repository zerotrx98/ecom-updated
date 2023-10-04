import 'dart:convert';

class OrderHistory {
  Orders? orders;
  int? status;

  OrderHistory({
    this.orders,
    this.status,
  });

  factory OrderHistory.fromRawJson(String str) => OrderHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
    orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "orders": orders?.toJson(),
    "status": status,
  };
}

class Orders {
  List<Order>? order;
  int? orderCount;

  Orders({
    this.order,
    this.orderCount,
  });

  factory Orders.fromRawJson(String str) => Orders.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    order: json["order"] == null ? [] : List<Order>.from(json["order"]!.map((x) => Order.fromJson(x))),
    orderCount: json["order_count"],
  );

  Map<String, dynamic> toJson() => {
    "order": order == null ? [] : List<dynamic>.from(order!.map((x) => x.toJson())),
    "order_count": orderCount,
  };
}

class Order {
  String? orderId;
  String? orderDate;
  String? deliveryAddress;
  String? orderAmount;
  String? gstAmount;
  String? wtotal;
  String? orderStatus;
  String? paymentStatus;
  List<OrderDetail>? orderDetails;
  dynamic deliveryDate;
  String? deliveryNote;
  String? deliveryCharge;
  String? paymentMode;
  String? invoice;
  String? convenientCharge;

  Order({
    this.orderId,
    this.orderDate,
    this.deliveryAddress,
    this.orderAmount,
    this.gstAmount,
    this.wtotal,
    this.orderStatus,
    this.paymentStatus,
    this.orderDetails,
    this.deliveryDate,
    this.deliveryNote,
    this.deliveryCharge,
    this.paymentMode,
    this.invoice,
    this.convenientCharge,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    orderDate: json["order_date"],
    deliveryAddress: json["delivery_address"],
    orderAmount: json["order_amount"],
    gstAmount: json["gst_amount"],
    wtotal: json["wtotal"],
    orderStatus: json["order_status"],
    paymentStatus: json["payment_status"],
    orderDetails: json["order_details"] == null ? [] : List<OrderDetail>.from(json["order_details"]!.map((x) => OrderDetail.fromJson(x))),
    deliveryDate: json["delivery_date"],
    deliveryNote: json["delivery_note"],
    deliveryCharge: json["delivery_charge"],
    paymentMode: json["payment_mode"],
    invoice: json["invoice"],
    convenientCharge: json["convenient_charge"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_date": orderDate,
    "delivery_address": deliveryAddress,
    "order_amount": orderAmount,
    "gst_amount": gstAmount,
    "wtotal": wtotal,
    "order_status": orderStatus,
    "payment_status": paymentStatus,
    "order_details": orderDetails == null ? [] : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
    "delivery_date": deliveryDate,
    "delivery_note": deliveryNote,
    "delivery_charge": deliveryCharge,
    "payment_mode": paymentMode,
    "invoice": invoice,
    "convenient_charge": convenientCharge,
  };
}

class OrderDetail {
  String? detailId;
  String? productId;
  String? productName;
  String? productQuantity;
  String? productType;
  String? productCost;
  String? productDiscount;
  String? productTotal;
  String? orderNote;
  String? skucode;
  String? wid;
  String? wamount;
  String? installation;
  String? productImage;

  OrderDetail({
    this.detailId,
    this.productId,
    this.productName,
    this.productQuantity,
    this.productType,
    this.productCost,
    this.productDiscount,
    this.productTotal,
    this.orderNote,
    this.skucode,
    this.wid,
    this.wamount,
    this.installation,
    this.productImage,
  });

  factory OrderDetail.fromRawJson(String str) => OrderDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    detailId: json["detail_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productQuantity: json["product_quantity"],
    productType: json["product_type"],
    productCost: json["product_cost"],
    productDiscount: json["product_discount"],
    productTotal: json["product_total"],
    orderNote: json["order_note"],
    skucode: json["skucode"],
    wid: json["wid"],
    wamount: json["wamount"],
    installation: json["installation"],
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "detail_id": detailId,
    "product_id": productId,
    "product_name": productName,
    "product_quantity": productQuantity,
    "product_type": productType,
    "product_cost": productCost,
    "product_discount": productDiscount,
    "product_total": productTotal,
    "order_note": orderNote,
    "skucode": skucode,
    "wid": wid,
    "wamount": wamount,
    "installation": installation,
    "product_image": productImage,
  };
}
