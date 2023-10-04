import 'dart:convert';

class RelatedProducts {
  int? status;
  List<Rproduct>? rproducts;

  RelatedProducts({
    this.status,
    this.rproducts,
  });

  factory RelatedProducts.fromRawJson(String str) => RelatedProducts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedProducts.fromJson(Map<String, dynamic> json) => RelatedProducts(
    status: json["status"],
    rproducts: json["rproducts"] == null ? [] : List<Rproduct>.from(json["rproducts"]!.map((x) => Rproduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "rproducts": rproducts == null ? [] : List<dynamic>.from(rproducts!.map((x) => x.toJson())),
  };
}

class Rproduct {
  String? productId;
  String? productName;
  String? productDescription;
  String? urlSlug;
  String? stockId;
  String? mrp;
  String? sellingPrice;
  String? quantity;
  dynamic offerId;
  dynamic offerStatus;
  dynamic offDiscountType;
  dynamic offerDiscount;
  dynamic offStartDate;
  dynamic offEndDate;
  String? userQty;
  String? isWishlist;
  String? cartDetailsId;
  String? wishlistDetailsId;
  String? orderCount;
  int? starCount;
  String? productImage;

  Rproduct({
    this.productId,
    this.productName,
    this.productDescription,
    this.urlSlug,
    this.stockId,
    this.mrp,
    this.sellingPrice,
    this.quantity,
    this.offerId,
    this.offerStatus,
    this.offDiscountType,
    this.offerDiscount,
    this.offStartDate,
    this.offEndDate,
    this.userQty,
    this.isWishlist,
    this.cartDetailsId,
    this.wishlistDetailsId,
    this.orderCount,
    this.starCount,
    this.productImage,
  });

  factory Rproduct.fromRawJson(String str) => Rproduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rproduct.fromJson(Map<String, dynamic> json) => Rproduct(
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    urlSlug: json["url_slug"],
    stockId: json["stock_id"],
    mrp: json["mrp"],
    sellingPrice: json["selling_price"],
    quantity: json["quantity"],
    offerId: json["offer_id"],
    offerStatus: json["offer_status"],
    offDiscountType: json["off_discount_type"],
    offerDiscount: json["offer_discount"],
    offStartDate: json["off_start_date"],
    offEndDate: json["off_end_date"],
    userQty: json["user_qty"],
    isWishlist: json["is_wishlist"],
    cartDetailsId: json["cart_details_id"],
    wishlistDetailsId: json["wishlist_details_id"],
    orderCount: json["order_count"],
    starCount: json["star_count"],
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_description": productDescription,
    "url_slug": urlSlug,
    "stock_id": stockId,
    "mrp": mrp,
    "selling_price": sellingPrice,
    "quantity": quantity,
    "offer_id": offerId,
    "offer_status": offerStatus,
    "off_discount_type": offDiscountType,
    "offer_discount": offerDiscount,
    "off_start_date": offStartDate,
    "off_end_date": offEndDate,
    "user_qty": userQty,
    "is_wishlist": isWishlist,
    "cart_details_id": cartDetailsId,
    "wishlist_details_id": wishlistDetailsId,
    "order_count": orderCount,
    "star_count": starCount,
    "product_image": productImage,
  };
}
