class Cart {
  String image;
  String name;
  String rate;
  int id;

  Cart({this.image, this.name,this.rate, this.id});

  factory Cart.fromDatabaseJson(Map<String, dynamic> data) => Cart(
    //This will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a
    id: data['id'],
    image: data['image'],
    name: data['name'],
    rate: data['rate'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert
    //are to be stored into the database in a form of JSON
    "id": this.id,
    "image": this.image,
    "name": this.name,
    "rate": this.rate,
  };
}
