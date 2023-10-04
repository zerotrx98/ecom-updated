import 'dart:convert';

class Categorieswise {
  int? status;
  List<ProductWise>? productWise;
  int? count;

  Categorieswise({
    this.status,
    this.productWise,
    this.count,
  });

  factory Categorieswise.fromRawJson(String str) => Categorieswise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categorieswise.fromJson(Map<String, dynamic> json) => Categorieswise(
    status: json["status"],
    productWise: json["product"] == null ? [] : List<ProductWise>.from(json["product"]!.map((x) => ProductWise.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "product": productWise == null ? [] : List<dynamic>.from(productWise!.map((x) => x.toJson())),
    "count": count,
  };
}

class ProductWise{
  String? productId;
  String? categoryId;
  String? subcategoryId;
  String? productUnit;
  String? productName;
  String? brandId;
  String? productDescription;
  String? productTags;
  String? refundable;
  String? skucode;
  String? barcode;
  String? taxType;
  String? taxPercent;
  String? productStatus;
  String? features;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  String? metaImage;
  String? urlSlug;
  String? urlName;
  String? colourss;
  String? productVideo;
  String? videoType;
  String? videoLink;
  String? productPdf;
  String? shippingStatus;
  String? quantityWarning;
  String? createdBy;
  String? featuredStatus;
  String? cashOnDelivery;
  String? todaysDeal;
  dynamic offerId;
  String? shippingTime;
  String? specialDateStart;
  String? specialDateEnd;
  String? specialDiscount;
  String? discountType;
  String? productNameArabic;
  String? productDescriptionArabic;
  String? featuresArabic;
  String? mrpArabic;
  String? sellingPriceArabic;
  String? quantityArabic;
  String? updatedOn;
  String? updatedBy;
  String? createdOn;
  String? installationSts;
  String? recommendedAge;
  String? dimension;
  String? productType;
  String? premiumStatus;
  String? stockId;
  String? mrp;
  String? sellingPrice;
  String? quantity;
  String? categoryid;
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
  List<Varient>? varients;
  List<Stockss>? stockss;
  int? starCount;
  String? productImage;
  String? mrpp;
  String? sellp;

  ProductWise({
    this.productId,
    this.categoryId,
    this.subcategoryId,
    this.productUnit,
    this.productName,
    this.brandId,
    this.productDescription,
    this.productTags,
    this.refundable,
    this.skucode,
    this.barcode,
    this.taxType,
    this.taxPercent,
    this.productStatus,
    this.features,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.metaImage,
    this.urlSlug,
    this.urlName,
    this.colourss,
    this.productVideo,
    this.videoType,
    this.videoLink,
    this.productPdf,
    this.shippingStatus,
    this.quantityWarning,
    this.createdBy,
    this.featuredStatus,
    this.cashOnDelivery,
    this.todaysDeal,
    this.offerId,
    this.shippingTime,
    this.specialDateStart,
    this.specialDateEnd,
    this.specialDiscount,
    this.discountType,
    this.productNameArabic,
    this.productDescriptionArabic,
    this.featuresArabic,
    this.mrpArabic,
    this.sellingPriceArabic,
    this.quantityArabic,
    this.updatedOn,
    this.updatedBy,
    this.createdOn,
    this.installationSts,
    this.recommendedAge,
    this.dimension,
    this.productType,
    this.premiumStatus,
    this.stockId,
    this.mrp,
    this.sellingPrice,
    this.quantity,
    this.categoryid,
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
    this.varients,
    this.stockss,
    this.starCount,
    this.productImage,
    this.mrpp,
    this.sellp,
  });

  factory ProductWise.fromRawJson(String str) => ProductWise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductWise.fromJson(Map<String, dynamic> json) => ProductWise(
    productId: json["product_id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    productUnit: json["product_unit"],
    productName: json["product_name"],
    brandId: json["brand_id"],
    productDescription: json["product_description"],
    productTags: json["product_tags"],
    refundable: json["refundable"],
    skucode: json["skucode"],
    barcode: json["barcode"],
    taxType: json["tax_type"],
    taxPercent: json["tax_percent"],
    productStatus: json["product_status"],
    features: json["features"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    metaImage: json["meta_image"],
    urlSlug: json["url_slug"],
    urlName: json["url_name"],
    colourss: json["colourss"],
    productVideo: json["product_video"],
    videoType: json["video_type"],
    videoLink: json["video_link"],
    productPdf: json["product_pdf"],
    shippingStatus: json["shipping_status"],
    quantityWarning: json["quantity_warning"],
    createdBy: json["created_by"],
    featuredStatus: json["featured_status"],
    cashOnDelivery: json["cash_on_delivery"],
    todaysDeal: json["todays_deal"],
    offerId: json["offer_id"],
    shippingTime: json["shipping_time"],
    specialDateStart: json["special_date_start"],
    specialDateEnd: json["special_date_end"],
    specialDiscount: json["special_discount"],
    discountType: json["discount_type"],
    productNameArabic: json["product_name_arabic"],
    productDescriptionArabic: json["product_description_arabic"],
    featuresArabic: json["features_arabic"],
    mrpArabic: json["mrp_arabic"],
    sellingPriceArabic: json["selling_price_arabic"],
    quantityArabic: json["quantity_arabic"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    createdOn: json["created_on"],
    installationSts: json["installation_sts"],
    recommendedAge: json["recommended_age"],
    dimension: json["dimension"],
    productType: json["product_type"],
    premiumStatus: json["premium_status"],
    stockId: json["stock_id"],
    mrp: json["mrp"],
    sellingPrice: json["selling_price"],
    quantity: json["quantity"],
    categoryid: json["categoryid"],
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
    varients: json["varients"] == null ? [] : List<Varient>.from(json["varients"]!.map((x) => Varient.fromJson(x))),
    stockss: json["stockss"] == null ? [] : List<Stockss>.from(json["stockss"]!.map((x) => Stockss.fromJson(x))),
    starCount: json["star_count"],
    productImage: json["product_image"],
    mrpp: json["mrpp"],
    sellp: json["sellp"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "product_unit": productUnit,
    "product_name": productName,
    "brand_id": brandId,
    "product_description": productDescription,
    "product_tags": productTags,
    "refundable": refundable,
    "skucode": skucode,
    "barcode": barcode,
    "tax_type": taxType,
    "tax_percent": taxPercent,
    "product_status": productStatus,
    "features": features,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "meta_image": metaImage,
    "url_slug": urlSlug,
    "url_name": urlName,
    "colourss": colourss,
    "product_video": productVideo,
    "video_type": videoType,
    "video_link": videoLink,
    "product_pdf": productPdf,
    "shipping_status": shippingStatus,
    "quantity_warning": quantityWarning,
    "created_by": createdBy,
    "featured_status": featuredStatus,
    "cash_on_delivery": cashOnDelivery,
    "todays_deal": todaysDeal,
    "offer_id": offerId,
    "shipping_time": shippingTime,
    "special_date_start": specialDateStart,
    "special_date_end": specialDateEnd,
    "special_discount": specialDiscount,
    "discount_type": discountType,
    "product_name_arabic": productNameArabic,
    "product_description_arabic": productDescriptionArabic,
    "features_arabic": featuresArabic,
    "mrp_arabic": mrpArabic,
    "selling_price_arabic": sellingPriceArabic,
    "quantity_arabic": quantityArabic,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
    "created_on": createdOn,
    "installation_sts": installationSts,
    "recommended_age": recommendedAge,
    "dimension": dimension,
    "product_type": productType,
    "premium_status": premiumStatus,
    "stock_id": stockId,
    "mrp": mrp,
    "selling_price": sellingPrice,
    "quantity": quantity,
    "categoryid": categoryid,
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
    "varients": varients == null ? [] : List<dynamic>.from(varients!.map((x) => x.toJson())),
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

class Varient {
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
  dynamic parent;
  dynamic value;

  Varient({
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
    this.parent,
    this.value,
  });

  factory Varient.fromRawJson(String str) => Varient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Varient.fromJson(Map<String, dynamic> json) => Varient(
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
    parent: json["parent"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
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
    "parent": parent,
    "value": value,
  };
}
