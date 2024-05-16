// To parse this JSON data, do
//
//     final businessResponseModel = businessResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:doodle_blur_task/app/features/business/domain/entity/business_entity.dart';

BusinessResponseModel businessResponseModelFromJson(String str) => BusinessResponseModel.fromJson(json.decode(str));

String businessResponseModelToJson(BusinessResponseModel data) => json.encode(data.toJson());

class BusinessResponseModel {
  List<Business> businesses;
  int total;
  Region region;

  BusinessResponseModel({
    required this.businesses,
    required this.total,
    required this.region,
  });

  factory BusinessResponseModel.fromJson(Map<String, dynamic> json) => BusinessResponseModel(
    businesses: List<Business>.from(json["businesses"].map((x) => Business.fromJson(x))),
    total: json["total"],
    region: Region.fromJson(json["region"]),
  );

  Map<String, dynamic> toJson() => {
    "businesses": List<dynamic>.from(businesses.map((x) => x.toJson())),
    "total": total,
    "region": region.toJson(),
  };

  BusinessEntity toEntity() => BusinessEntity(businesses: businesses, total: total, region: region);
}

class Business {
  String id;
  String alias;
  String name;
  String imageUrl;
  bool isClosed;
  String url;
  int reviewCount;
  List<Category> categories;
  double rating;
  Center coordinates;
  List<Transaction> transactions;
  String price;
  Location location;
  String phone;
  String displayPhone;
  double distance;

  Business({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.coordinates,
    required this.transactions,
    required this.price,
    required this.location,
    required this.phone,
    required this.displayPhone,
    required this.distance,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    id: json["id"],
    alias: json["alias"],
    name: json["name"],
    imageUrl: json["image_url"],
    isClosed: json["is_closed"],
    url: json["url"],
    reviewCount: json["review_count"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    rating: json["rating"]?.toDouble(),
    coordinates: Center.fromJson(json["coordinates"]),
    transactions: List<Transaction>.from(json["transactions"].map((x) => transactionValues.map[x]!)),
    price: json["price"] ?? "",
    location: Location.fromJson(json["location"]),
    phone: json["phone"],
    displayPhone: json["display_phone"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alias": alias,
    "name": name,
    "image_url": imageUrl,
    "is_closed": isClosed,
    "url": url,
    "review_count": reviewCount,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "rating": rating,
    "coordinates": coordinates.toJson(),
    "transactions": List<dynamic>.from(transactions.map((x) => transactionValues.reverse[x])),
    "price": priceValues.reverse[price],
    "location": location.toJson(),
    "phone": phone,
    "display_phone": displayPhone,
    "distance": distance,
  };
}

class Category {
  String alias;
  String title;

  Category({
    required this.alias,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    alias: json["alias"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "alias": alias,
    "title": title,
  };
}

class Center {
  double latitude;
  double longitude;

  Center({
    required this.latitude,
    required this.longitude,
  });

  factory Center.fromJson(Map<String, dynamic> json) => Center(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Location {
  String address1;
  String? address2;
  String? address3;
  City city;
  String zipCode;
  Country country;
  BusinessState state;
  List<String> displayAddress;

  Location({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address1: json["address1"],
    address2: json["address2"],
    address3: json["address3"],
    city: cityValues.map[json["city"]]!,
    zipCode: json["zip_code"],
    country: countryValues.map[json["country"]]!,
    state: stateValues.map[json["state"]]!,
    displayAddress: List<String>.from(json["display_address"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "address1": address1,
    "address2": address2,
    "address3": address3,
    "city": cityValues.reverse[city],
    "zip_code": zipCode,
    "country": countryValues.reverse[country],
    "state": stateValues.reverse[state],
    "display_address": List<dynamic>.from(displayAddress.map((x) => x)),
  };
}

enum City {
  BROOKLYN,
  NEW_YORK
}

final cityValues = EnumValues({
  "Brooklyn": City.BROOKLYN,
  "New York": City.NEW_YORK
});

enum Country {
  US
}

final countryValues = EnumValues({
  "US": Country.US
});

enum BusinessState {
  NY
}

final stateValues = EnumValues({
  "NY": BusinessState.NY
});

enum Price {
  EMPTY,
  PRICE,
  PURPLE
}

final priceValues = EnumValues({
  "\u0024\u0024": Price.EMPTY,
  "\u0024\u0024\u0024\u0024": Price.PRICE,
  "\u0024\u0024\u0024": Price.PURPLE
});

enum Transaction {
  DELIVERY,
  PICKUP,
  RESTAURANT_RESERVATION
}

final transactionValues = EnumValues({
  "delivery": Transaction.DELIVERY,
  "pickup": Transaction.PICKUP,
  "restaurant_reservation": Transaction.RESTAURANT_RESERVATION
});

class Region {
  Center center;

  Region({
    required this.center,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    center: Center.fromJson(json["center"]),
  );

  Map<String, dynamic> toJson() => {
    "center": center.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
