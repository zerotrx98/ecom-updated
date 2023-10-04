import 'dart:convert';

class MyWishlist {
  List<Wishlist>? wishlist;
  int? status;

  MyWishlist({
    this.wishlist,
    this.status,
  });

  factory MyWishlist.fromRawJson(String str) => MyWishlist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyWishlist.fromJson(Map<String, dynamic> json) => MyWishlist(
    wishlist: json["wishlist"] == null ? [] : List<Wishlist>.from(json["wishlist"]!.map((x) => Wishlist.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "wishlist": wishlist == null ? [] : List<dynamic>.from(wishlist!.map((x) => x.toJson())),
    "status": status,
  };
}

class Wishlist {
  String? wishlistId;
  String? wishCount;
  String? wishAmnt;
  List<Detail>? details;

  Wishlist({
    this.wishlistId,
    this.wishCount,
    this.wishAmnt,
    this.details,
  });

  factory Wishlist.fromRawJson(String str) => Wishlist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    wishlistId: json["wishlist_id"],
    wishCount: json["wish_count"],
    wishAmnt: json["wish_amnt"],
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "wishlist_id": wishlistId,
    "wish_count": wishCount,
    "wish_amnt": wishAmnt,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  String? wishlistDetailsId;
  String? wishlistId;
  String? productId;
  String? stockId;
  String? varientQuantity;
  String? productName;
  String? itemQuantity;
  String? itemPrice;
  String? sellingPrice;
  String? itemOfferPrice;
  String? itemTotal;
  String? itemOfferTotal;
  String? urlSlug;
  String? productImage;
  String? userQty;

  Detail({
    this.wishlistDetailsId,
    this.wishlistId,
    this.productId,
    this.stockId,
    this.varientQuantity,
    this.productName,
    this.itemQuantity,
    this.itemPrice,
    this.sellingPrice,
    this.itemOfferPrice,
    this.itemTotal,
    this.itemOfferTotal,
    this.urlSlug,
    this.productImage,
    this.userQty,
  });

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    wishlistDetailsId: json["wishlist_details_id"],
    wishlistId: json["wishlist_id"],
    productId: json["product_id"],
    stockId: json["stock_id"],
    varientQuantity: json["varient_quantity"],
    productName: json["product_name"],
    itemQuantity: json["item_quantity"],
    itemPrice: json["item_price"],
    sellingPrice: json["selling_price"],
    itemOfferPrice: json["item_offer_price"],
    itemTotal: json["item_total"],
    itemOfferTotal: json["item_offer_total"],
    urlSlug: json["url_slug"],
    productImage: json["product_image"],
    userQty: json["user_qty"],
  );

  Map<String, dynamic> toJson() => {
    "wishlist_details_id": wishlistDetailsId,
    "wishlist_id": wishlistId,
    "product_id": productId,
    "stock_id": stockId,
    "varient_quantity": varientQuantity,
    "product_name": productName,
    "item_quantity": itemQuantity,
    "item_price": itemPrice,
    "selling_price": sellingPrice,
    "item_offer_price": itemOfferPrice,
    "item_total": itemTotal,
    "item_offer_total": itemOfferTotal,
    "url_slug": urlSlug,
    "product_image": productImage,
    "user_qty": userQty,
  };
}
