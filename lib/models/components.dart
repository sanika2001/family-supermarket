class Components {
  String image;
  String name;
  int id;

  Components({this.image, this.name, this.id});

  factory Components.fromDatabaseJson(Map<String, dynamic> data) => Components(
    //This will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a
    id: data['id'],
    image: data['image'],
    name: data['name'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert
    //are to be stored into the datbase in a form of JSON
    "id": this.id,
    "image": this.image,
    "name": this.name,
  };
}
