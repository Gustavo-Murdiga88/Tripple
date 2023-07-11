import 'dart:convert';

class FetchModel {
  final String avatar_url;
  final String? location;
  final String name;

  FetchModel({required this.avatar_url, this.location, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar_url': avatar_url,
      'location': location,
      'name': name,
    };
  }

  factory FetchModel.fromMap(Map<String, dynamic> map) {
    return FetchModel(
      avatar_url: map['avatar_url'] as String,
      location: map['location'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchModel.fromJson(String source) =>
      FetchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  FetchModel copyWith({
    String? avatar_url,
    String? location,
    String? name,
  }) {
    return FetchModel(
      avatar_url: avatar_url ?? this.avatar_url,
      location: location ?? this.location,
      name: name ?? this.name,
    );
  }
}
