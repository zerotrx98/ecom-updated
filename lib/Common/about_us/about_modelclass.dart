import 'dart:convert';

class About {
  List<AboutElement>? about;

  About({
    this.about,
  });

  factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory About.fromJson(Map<String, dynamic> json) => About(
    about: json["about"] == null ? [] : List<AboutElement>.from(json["about"]!.map((x) => AboutElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x.toJson())),
  };
}

class AboutElement {
  String? id;
  String? abTitle;
  String? abContent;
  String? abBanner;
  String? abStatus;
  String? updatedBy;
  String? updatedOn;

  AboutElement({
    this.id,
    this.abTitle,
    this.abContent,
    this.abBanner,
    this.abStatus,
    this.updatedBy,
    this.updatedOn,
  });

  factory AboutElement.fromRawJson(String str) => AboutElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutElement.fromJson(Map<String, dynamic> json) => AboutElement(
    id: json["id"],
    abTitle: json["ab_title"],
    abContent: json["ab_content"],
    abBanner: json["ab_banner"],
    abStatus: json["ab_status"],
    updatedBy: json["updated_by"],
    updatedOn: json["updated_on"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ab_title": abTitle,
    "ab_content": abContent,
    "ab_banner": abBanner,
    "ab_status": abStatus,
    "updated_by": updatedBy,
    "updated_on": updatedOn,
  };
}
