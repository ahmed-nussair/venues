// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Venue {
  final int? id;
  final num? lat;
  final num? lon;
  final String? category;
  final String? name;
  final DateTime? createdOn;
  final String? geolocationDegrees;

  Venue({
    required this.id,
    required this.lat,
    required this.lon,
    required this.category,
    required this.name,
    required this.createdOn,
    required this.geolocationDegrees,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lat': lat,
      'lon': lon,
      'category': category,
      'name': name,
      'created_on': createdOn?.millisecondsSinceEpoch,
      'geolocation_degrees': geolocationDegrees,
    };
  }

  factory Venue.fromMap(Map<String, dynamic> map) {
    return Venue(
      id: map['id'] != null ? map['id'] as int : null,
      lat: map['lat'] != null ? map['lat'] as num : null,
      lon: map['lon'] != null ? map['lon'] as num : null,
      category: map['category'] != null ? map['category'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      createdOn: DateTime.fromMillisecondsSinceEpoch(map['created_on'] as int),
      geolocationDegrees: map['geolocation_degrees'] != null
          ? map['geolocation_degrees'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Venue.fromJson(String source) =>
      Venue.fromMap(json.decode(source) as Map<String, dynamic>);
}
