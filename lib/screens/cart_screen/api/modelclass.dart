import 'dart:convert';

class MyCart {
  List<Cart>? cart;
  int? cartCount;
  int? status;

  MyCart({
    this.cart,
    this.cartCount,
    this.status,
  });

  factory MyCart.fromRawJson(String str) => MyCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
    cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
    cartCount: json["cart_count"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
    "cart_count": cartCount,
    "status": status,
  };
}

class Cart {
  String? cartId;
  String? cartCount;
  String? cartAmnt;
  List<Detail>? details;

  Cart({
    this.cartId,
    this.cartCount,
    this.cartAmnt,
    this.details,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    cartCount: json["cart_count"],
    cartAmnt: json["cart_amnt"],
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "cart_count": cartCount,
    "cart_amnt": cartAmnt,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  String? cartDetailsId;
  String? cartId;
  String? stockId;
  String? quantity;
  String? productName;
  String? itemQuantity;
  String? itemPrice;
  String? sellingPrice;
  String? itemOfferPrice;
  String? itemTotal;
  String? itemOfferTotal;
  String? couponId;
  String? wamount;
  String? wid;
  String? installation;
  String? urlSlug;
  String? shippingTime;
  String? productImage;
  String? productVarientId;
  String? productId;
  String? varientId;
  String? varientName;
  String? varientStatus;
  String? createdBy;
  DateTime? createdAt;
  String? updatedOn;
  String? updatedBy;
  String? material;
  String? size;
  String? colour;
  String? weight;
  String? dimensions;
  String? productType;

  Detail({
    this.cartDetailsId,
    this.cartId,
    this.stockId,
    this.quantity,
    this.productName,
    this.itemQuantity,
    this.itemPrice,
    this.sellingPrice,
    this.itemOfferPrice,
    this.itemTotal,
    this.itemOfferTotal,
    this.couponId,
    this.wamount,
    this.wid,
    this.installation,
    this.urlSlug,
    this.shippingTime,
    this.productImage,
    this.productVarientId,
    this.productId,
    this.varientId,
    this.varientName,
    this.varientStatus,
    this.createdBy,
    this.createdAt,
    this.updatedOn,
    this.updatedBy,
    this.material,
    this.size,
    this.colour,
    this.weight,
    this.dimensions,
    this.productType,
  });

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    cartDetailsId: json["cart_details_id"],
    cartId: json["cart_id"],
    stockId: json["stock_id"],
    quantity: json["quantity"],
    productName: json["product_name"],
    itemQuantity: json["item_quantity"],
    itemPrice: json["item_price"],
    sellingPrice: json["selling_price"],
    itemOfferPrice: json["item_offer_price"],
    itemTotal: json["item_total"],
    itemOfferTotal: json["item_offer_total"],
    couponId: json["coupon_id"],
    wamount: json["wamount"],
    wid: json["wid"],
    installation: json["installation"],
    urlSlug: json["url_slug"],
    shippingTime: json["shipping_time"],
    productImage: json["product_image"],
    productVarientId: json["product_varient_id"],
    productId: json["product_id"],
    varientId: json["varient_id"],
    varientName: json["varient_name"],
    varientStatus: json["varient_status"],
    createdBy: json["created_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    material: json["material"],
    size: json["size"],
    colour: json["colour"],
    weight: json["weight"],
    dimensions: json["dimensions"],
    productType: json["product_type"],
  );

  Map<String, dynamic> toJson() => {
    "cart_details_id": cartDetailsId,
    "cart_id": cartId,
    "stock_id": stockId,
    "quantity": quantity,
    "product_name": productName,
    "item_quantity": itemQuantity,
    "item_price": itemPrice,
    "selling_price": sellingPrice,
    "item_offer_price": itemOfferPrice,
    "item_total": itemTotal,
    "item_offer_total": itemOfferTotal,
    "coupon_id": couponId,
    "wamount": wamount,
    "wid": wid,
    "installation": installation,
    "url_slug": urlSlug,
    "shipping_time": shippingTime,
    "product_image": productImage,
    "product_varient_id": productVarientId,
    "product_id": productId,
    "varient_id": varientId,
    "varient_name": varientName,
    "varient_status": varientStatus,
    "created_by": createdBy,
    "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
    "updated_on": updatedOn,
    "updated_by": updatedBy,
    "material": material,
    "size": size,
    "colour": colour,
    "weight": weight,
    "dimensions": dimensions,
    "product_type": productType,
  };
}
