import 'dart:convert';

class BannerImages {
  List<Banner>? banners;
  int? status;

  BannerImages({
    this.banners,
    this.status,
  });

  factory BannerImages.fromRawJson(String str) => BannerImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerImages.fromJson(Map<String, dynamic> json) => BannerImages(
    banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
    "status": status,
  };
}

class Banner {
  String? bannerId;
  String? bannerName;
  String? secondLine;
  String? bannerImage;
  String? bannerImageArabic;
  String? bannerType;
  String? bannerOrder;
  String? bannerUrl;
  String? bannerStatus;
  String? createdOn;
  String? updatedOn;
  String? updatedBy;
  String? createdBy;

  Banner({
    this.bannerId,
    this.bannerName,
    this.secondLine,
    this.bannerImage,
    this.bannerImageArabic,
    this.bannerType,
    this.bannerOrder,
    this.bannerUrl,
    this.bannerStatus,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.createdBy,
  });

  factory Banner.fromRawJson(String str) => Banner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    bannerId: json["banner_id"],
    bannerName: json["banner_name"],
    secondLine: json["second_line"],
    bannerImage: json["banner_image"],
    bannerImageArabic: json["banner_image_arabic"],
    bannerType: json["banner_type"],
    bannerOrder: json["banner_order"],
    bannerUrl: json["banner_url"],
    bannerStatus: json["banner_status"],
    createdOn: json["created_on"],
    updatedOn: json["updated_on"],
    updatedBy: json["updated_by"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "banner_name": bannerName,
    "second_line": secondLine,
    "banner_image": bannerImage,
    "banner_image_arabic": bannerImageArabic,
    "banner_type": bannerType,
    "banner_order": bannerOrder,
    "banner_url": bannerUrl,
    "banner_status": bannerStatus,
    "created_on": createdOn,
    "updated_on": updatedOn,
    "updated_by": updatedBy,
    "created_by": createdBy,
  };
}
