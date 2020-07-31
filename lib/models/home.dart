class Home {
  String image;
  String name;
  int id;

  Home({this.image, this.name, this.id});

  factory Home.fromDatabaseJson(Map<String, dynamic> data) => Home(
        //This will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Todo object
        id: data['id'],
        image: data['image'],
        name: data['name'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Todo objects that
        //are to be stored into the datbase in a form of JSON
        "id": this.id,
        "image": this.image,
        "name": this.name,
      };
}
