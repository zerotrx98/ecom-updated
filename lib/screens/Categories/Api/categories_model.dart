import 'dart:convert';

class Categories {
  List<Category>? category;
  int? status;

  Categories({
    this.category,
    this.status,
  });

  factory Categories.fromRawJson(String str) => Categories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
    "status": status,
  };
}

class Category {
  String? categoryId;
  String? categoryName;
  String? metaTitle;
  String? metaDescription;
  String? categoryNameArabic;
  String? parentId;
  String? subparentId;
  String? categoryDisplayOrder;
  String? categoryImage;
  String? categoryBanner;
  String? categoryBannerArabic;
  String? bannerUrl;
  String? headerImg;
  String? description;
  String? setAsTop;
  String? setAsHome;
  String? featured;
  dynamic keywords;
  String? categoryStatus;
  String? createdOn;
  String? updatedOn;
  String? updatedBy;
  String? homeStatus;
  String? footerContent;

  Category({
    this.categoryId,
    this.categoryName,
    this.metaTitle,
    this.metaDescription,
    this.categoryNameArabic,
    this.parentId,
    this.subparentId,
    this.categoryDisplayOrder,
    this.categoryImage,
    this.categoryBanner,
    this.categoryBannerArabic,
    this.bannerUrl,
    this.headerImg,
    this.description,
    this.setAsTop,
    this.setAsHome,
    this.featured,
    this.keywords,
    this.categoryStatus,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.homeStatus,
    this.footerContent,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    categoryNameArabic: json["category_name_arabic"],
    parentId: json["parent_id"],
    subparentId: json["subparent_id"],
    categoryDisplayOrder: json["category_display_order"],
    categoryImage: json["category_image"],
    categoryBanner: json["category_banner"],
    categoryBannerArabic: json["category_banner_arabic"],
    bannerUrl: json["banner_url"],
    headerImg: json["header_img"],
    description: json["description"],
    setAsTop: json["set_as_top"],
    setAsHome: json["set_as_home"],
    featured: json["featured"],
    keywords: json["keywords"],
    categoryStatus: json["category_status"],
    createdOn: json["created_on"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    homeStatus: json["home_status"],
    footerContent: json["footer_content"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "category_name_arabic": categoryNameArabic,
    "parent_id": parentId,
    "subparent_id": subparentId,
    "category_display_order": categoryDisplayOrder,
    "category_image": categoryImage,
    "category_banner": categoryBanner,
    "category_banner_arabic": categoryBannerArabic,
    "banner_url": bannerUrl,
    "header_img": headerImg,
    "description": description,
    "set_as_top": setAsTop,
    "set_as_home": setAsHome,
    "featured": featured,
    "keywords": keywords,
    "category_status": categoryStatus,
    "created_on": createdOn,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
    "home_status": homeStatus,
    "footer_content": footerContent,
  };
}
