class UserModel {
  String? email;
  String? name;
  String? phone;
  DateTime? createdAt;
  int? totalAds;
  List? favorites;

  UserModel(
      {this.email,
      this.name,
      this.favorites,
      this.phone,
      this.totalAds,
      this.createdAt});

  fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        createdAt: json['time'],
        favorites: json['favorites'],
        totalAds: json['totalAds']);
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'favorites': favorites,
      'totalAds': totalAds
    };
  }
}
