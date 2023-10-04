import 'dart:convert';

class ProductDetails {
  Details? details;
  int? status;

  ProductDetails({
    this.details,
    this.status,
  });

  factory ProductDetails.fromRawJson(String str) => ProductDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "details": details?.toJson(),
    "status": status,
  };
}

class Details {
  String? productId;
  String? productName;
  String? productDescription;
  String? urlSlug;
  String? mrp;
  String? sellingPrice;
  String? quantity;
  String? stockId;
  dynamic offerId;
  dynamic offerStatus;
  dynamic offDiscountType;
  dynamic offerDiscount;
  dynamic offStartDate;
  dynamic offEndDate;
  String? productImage;
  dynamic brandName;
  dynamic brandIcon;
  String? userQty;
  String? isWishlist;
  String? cartDetailsId;
  String? wishlistDetailsId;
  String? orderCount;
  List<Stockss>? stockss;
  String? isOrdered;

  Details({
    this.productId,
    this.productName,
    this.productDescription,
    this.urlSlug,
    this.mrp,
    this.sellingPrice,
    this.quantity,
    this.stockId,
    this.offerId,
    this.offerStatus,
    this.offDiscountType,
    this.offerDiscount,
    this.offStartDate,
    this.offEndDate,
    this.productImage,
    this.brandName,
    this.brandIcon,
    this.userQty,
    this.isWishlist,
    this.cartDetailsId,
    this.wishlistDetailsId,
    this.orderCount,
    this.stockss,
    this.isOrdered,
  });

  factory Details.fromRawJson(String str) => Details.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    urlSlug: json["url_slug"],
    mrp: json["mrp"],
    sellingPrice: json["selling_price"],
    quantity: json["quantity"],
    stockId: json["stock_id"],
    offerId: json["offer_id"],
    offerStatus: json["offer_status"],
    offDiscountType: json["off_discount_type"],
    offerDiscount: json["offer_discount"],
    offStartDate: json["off_start_date"],
    offEndDate: json["off_end_date"],
    productImage: json["product_image"],
    brandName: json["brand_name"],
    brandIcon: json["brand_icon"],
    userQty: json["user_qty"],
    isWishlist: json["is_wishlist"],
    cartDetailsId: json["cart_details_id"],
    wishlistDetailsId: json["wishlist_details_id"],
    orderCount: json["order_count"],
    stockss: json["stockss"] == null ? [] : List<Stockss>.from(json["stockss"]!.map((x) => Stockss.fromJson(x))),
    isOrdered: json["is_ordered"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_description": productDescription,
    "url_slug": urlSlug,
    "mrp": mrp,
    "selling_price": sellingPrice,
    "quantity": quantity,
    "stock_id": stockId,
    "offer_id": offerId,
    "offer_status": offerStatus,
    "off_discount_type": offDiscountType,
    "offer_discount": offerDiscount,
    "off_start_date": offStartDate,
    "off_end_date": offEndDate,
    "product_image": productImage,
    "brand_name": brandName,
    "brand_icon": brandIcon,
    "user_qty": userQty,
    "is_wishlist": isWishlist,
    "cart_details_id": cartDetailsId,
    "wishlist_details_id": wishlistDetailsId,
    "order_count": orderCount,
    "stockss": stockss == null ? [] : List<dynamic>.from(stockss!.map((x) => x.toJson())),
    "is_ordered": isOrdered,
  };
}

class Stockss {
  String? stockId;
  String? productVarientId;
  String? varientName;

  Stockss({
    this.stockId,
    this.productVarientId,
    this.varientName,
  });

  factory Stockss.fromRawJson(String str) => Stockss.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stockss.fromJson(Map<String, dynamic> json) => Stockss(
    stockId: json["stock_id"],
    productVarientId: json["product_varient_id"],
    varientName: json["varient_name"],
  );

  Map<String, dynamic> toJson() => {
    "stock_id": stockId,
    "product_varient_id": productVarientId,
    "varient_name": varientName,
  };
}






