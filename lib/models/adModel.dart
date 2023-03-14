class AdModel {
  DateTime? createdAt;
  List? createdBy;
  String? desc;
  String? details;
  List<String>? image;
  int? likes;
  List? location;
  int? price;
  String? title;

  AdModel(
      {this.createdAt,
      this.createdBy,
      this.desc,
      this.details,
      this.image,
      this.likes,
      this.location,
      this.price,
      this.title});

  fromJson(Map<String, dynamic> json) {
    return AdModel(
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      desc: json['desc'],
      details: json['details'],
      image: json['image'],
      likes: json['likes'],
      location: json['location'],
      price: json['price'],
      title: json['title'],
    );
  }

  toJson() {
    return {
      'createdAt': createdAt,
      'createdBy': createdBy,
      'desc': desc,
      'details': details,
      'image': image,
      'likes': likes,
      'location': location,
      'price': price,
      'title': title
    };
  }
}
