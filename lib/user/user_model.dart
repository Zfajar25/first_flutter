class UserData {
  String name;
  String email;
  String username;
  Address address;

  UserData(
      {required this.name,
      required this.email,
      required this.username,
      required this.address});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(
      {required this.street,
      required this.city,
      required this.suite,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        city: json['city'],
        suite: json['suite'],
        zipcode: json['zipcode'],
        geo: Geo.fromJson(json['geo']));
  }
}

class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], lng: json['lng']);
  }
}
