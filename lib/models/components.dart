class Components {
  String image;
  String name;
  int id;

  Components({this.image, this.name, this.id});

  factory Components.fromDatabaseJson(Map<String, dynamic> data) => Components(
        id: data['id'],
        image: data['image'],
        name: data['name'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "image": this.image,
        "name": this.name,
      };
}
