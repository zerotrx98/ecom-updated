import 'dart:convert';

class Profile {
  Customer? customer;
  Address? address;
  List<Address>? allAddress;
  int? status;

  Profile({
    this.customer,
    this.address,
    this.allAddress,
    this.status,
  });

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    allAddress: json["all_address"] == null ? [] : List<Address>.from(json["all_address"]!.map((x) => Address.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer?.toJson(),
    "address": address?.toJson(),
    "all_address": allAddress == null ? [] : List<dynamic>.from(allAddress!.map((x) => x.toJson())),
    "status": status,
  };
}

class Address {
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? alternatePhone;
  String? customerLandmark;
  String? country;
  String? customerCity;
  String? addressType;
  String? addressId;
  String? customerAddress;
  dynamic customerState;
  String? sId;
  String? dId;
  dynamic customerDistrict;
  String? customerPincode;
  String? setAsDefault;
  dynamic stateId;
  String? longitude;
  String? latitude;
  String? setBillDefault;

  Address({
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.alternatePhone,
    this.customerLandmark,
    this.country,
    this.customerCity,
    this.addressType,
    this.addressId,
    this.customerAddress,
    this.customerState,
    this.sId,
    this.dId,
    this.customerDistrict,
    this.customerPincode,
    this.setAsDefault,
    this.stateId,
    this.longitude,
    this.latitude,
    this.setBillDefault,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    name: json["name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    alternatePhone: json["alternate_phone"],
    customerLandmark: json["customer_landmark"],
    country: json["country"],
    customerCity: json["customer_city"],
    addressType: json["address_type"],
    addressId: json["address_id"],
    customerAddress: json["customer_address"],
    customerState: json["customer_state"],
    sId: json["s_id"],
    dId: json["d_id"],
    customerDistrict: json["customer_district"],
    customerPincode: json["customer_pincode"],
    setAsDefault: json["set_as_default"],
    stateId: json["state_id"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    setBillDefault: json["set_bill_default"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "alternate_phone": alternatePhone,
    "customer_landmark": customerLandmark,
    "country": country,
    "customer_city": customerCity,
    "address_type": addressType,
    "address_id": addressId,
    "customer_address": customerAddress,
    "customer_state": customerState,
    "s_id": sId,
    "d_id": dId,
    "customer_district": customerDistrict,
    "customer_pincode": customerPincode,
    "set_as_default": setAsDefault,
    "state_id": stateId,
    "longitude": longitude,
    "latitude": latitude,
    "set_bill_default": setBillDefault,
  };
}

class Customer {
  String? customerId;
  String? customerName;
  String? lastName;
  String? customerEmail;
  String? customerPhone;
  String? customerDob;
  String? customerGender;
  String? customerStatus;

  Customer({
    this.customerId,
    this.customerName,
    this.lastName,
    this.customerEmail,
    this.customerPhone,
    this.customerDob,
    this.customerGender,
    this.customerStatus,
  });

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    lastName: json["last_name"],
    customerEmail: json["customer_email"],
    customerPhone: json["customer_phone"],
    customerDob: json["customer_dob"],
    customerGender: json["customer_gender"],
    customerStatus: json["customer_status"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_name": customerName,
    "last_name": lastName,
    "customer_email": customerEmail,
    "customer_phone": customerPhone,
    "customer_dob": customerDob,
    "customer_gender": customerGender,
    "customer_status": customerStatus,
  };
}
