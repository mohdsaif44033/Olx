class UserModel {
  String email;
  String uid;
  String name;
  String phone;
  DateTime createdAt;
  int totalAds;
  List favouriteAd;

  UserModel(
      {required this.email,
      required this.name,
      required this.uid,
      required this.favouriteAd,
      required this.phone,
      required this.totalAds,
      required this.createdAt});

  fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name']??'',
        email: json['email']??'',
        phone: json['phone']??'',
        createdAt: json['time']??'',
        uid: json["uid"]??'',
        favouriteAd: json['favouriteAd']??'',
        totalAds: json['totalAds'] ??'');
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'uid': uid,
      'favouriteAd': favouriteAd,
      'totalAds': totalAds
    };
  }
}
