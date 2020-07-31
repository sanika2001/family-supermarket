class Products {
  String image;

  Products({this.image});

  factory Products.fromDatabaseJson(Map<String, dynamic> data) => Products(
        image: data['image'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "image": this.image,
      };
}
