class Detail{
  String image;
  String name;
  int id;
  String price;

  Detail({this.image, this.name, this.id,this.price});

  factory Detail.fromDatabaseJson(Map<String, dynamic> data) => Detail(
    //This will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a
    id: data['id'],
    image: data['image'],
    name: data['name'],
    price: data['price'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert
    //are to be stored into the datbase in a form of JSON
    "id": this.id,
    "image": this.image,
    "name": this.name,
    "price": this.price,
  };
}