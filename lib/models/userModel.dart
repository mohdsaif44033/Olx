class UserModel {
  String? email;
  String? name;
  String? phone;
  DateTime? createdAt;
  int? totalAds;
  List? favouriteAd;

  UserModel(
      {this.email,
      this.name,
      this.favouriteAd,
      this.phone,
      this.totalAds,
      this.createdAt});
  fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        createdAt: json['time'],
        favouriteAd: json['favouriteAd'],
        totalAds: json['totalAds']);
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'favouriteAd': favouriteAd,
      'totalAds': totalAds
    };
  }
}
