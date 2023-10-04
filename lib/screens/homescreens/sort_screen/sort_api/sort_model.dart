import 'dart:convert';

class SortScreen {
  List<A>? a;
  String? count;

  SortScreen({
    this.a,
    this.count,
  });

  factory SortScreen.fromRawJson(String str) => SortScreen.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SortScreen.fromJson(Map<String, dynamic> json) => SortScreen(
    a: json["a"] == null ? [] : List<A>.from(json["a"]!.map((x) => A.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "a": a == null ? [] : List<dynamic>.from(a!.map((x) => x.toJson())),
    "count": count,
  };
}

class A {
  String? productId;
  String? productName;
  String? mrp;
  String? sellingPrice;
  String? quantity;
  String? urlName;
  String? urlSlug;
  String? stockId;
  String? categoryid;
  dynamic offerId;
  dynamic offerStatus;
  dynamic offDiscountType;
  dynamic offerDiscount;
  String? userQty;
  String? isWishlist;
  String? cartDetailsId;
  String? wishlistDetailsId;
  String? orderCount;
  List<Map<String, String?>>? varients;
  List<Stockss>? stockss;
  int? starCount;
  String? productImage;
  String? mrpp;
  String? sellp;

  A({
    this.productId,
    this.productName,
    this.mrp,
    this.sellingPrice,
    this.quantity,
    this.urlName,
    this.urlSlug,
    this.stockId,
    this.categoryid,
    this.offerId,
    this.offerStatus,
    this.offDiscountType,
    this.offerDiscount,
    this.userQty,
    this.isWishlist,
    this.cartDetailsId,
    this.wishlistDetailsId,
    this.orderCount,
    this.varients,
    this.stockss,
    this.starCount,
    this.productImage,
    this.mrpp,
    this.sellp,
  });

  factory A.fromRawJson(String str) => A.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory A.fromJson(Map<String, dynamic> json) => A(
    productId: json["product_id"],
    productName: json["product_name"],
    mrp: json["mrp"],
    sellingPrice: json["selling_price"],
    quantity: json["quantity"],
    urlName: json["url_name"],
    urlSlug: json["url_slug"],
    stockId: json["stock_id"],
    categoryid: json["categoryid"],
    offerId: json["offer_id"],
    offerStatus: json["offer_status"],
    offDiscountType: json["off_discount_type"],
    offerDiscount: json["offer_discount"],
    userQty: json["user_qty"],
    isWishlist: json["is_wishlist"],
    cartDetailsId: json["cart_details_id"],
    wishlistDetailsId: json["wishlist_details_id"],
    orderCount: json["order_count"],
    varients: json["varients"] == null ? [] : List<Map<String, String?>>.from(json["varients"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    stockss: json["stockss"] == null ? [] : List<Stockss>.from(json["stockss"]!.map((x) => Stockss.fromJson(x))),
    starCount: json["star_count"],
    productImage: json["product_image"],
    mrpp: json["mrpp"],
    sellp: json["sellp"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "mrp": mrp,
    "selling_price": sellingPrice,
    "quantity": quantity,
    "url_name": urlName,
    "url_slug": urlSlug,
    "stock_id": stockId,
    "categoryid": categoryid,
    "offer_id": offerId,
    "offer_status": offerStatus,
    "off_discount_type": offDiscountType,
    "offer_discount": offerDiscount,
    "user_qty": userQty,
    "is_wishlist": isWishlist,
    "cart_details_id": cartDetailsId,
    "wishlist_details_id": wishlistDetailsId,
    "order_count": orderCount,
    "varients": varients == null ? [] : List<dynamic>.from(varients!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "stockss": stockss == null ? [] : List<dynamic>.from(stockss!.map((x) => x.toJson())),
    "star_count": starCount,
    "product_image": productImage,
    "mrpp": mrpp,
    "sellp": sellp,
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
