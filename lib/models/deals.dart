class Deals {
  String image;

  Deals({this.image});

  factory Deals.fromDatabaseJson(Map<String, dynamic> data) => Deals(
        image: data['image'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "image": this.image,
      };

//  set image(String image) {
//    this._image = image;
//  }
//
//  String get image => this._image;
}
