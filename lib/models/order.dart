class Order{
  String image;
  String name;
  int id;
  String date;

  Order({this.image, this.name, this.id,this.date});

  factory Order.fromDatabaseJson(Map<String, dynamic> data) => Order(
    //This will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a
    id: data['id'],
    image: data['image'],
    name: data['name'],
    date: data['date'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert
    //are to be stored into the datbase in a form of JSON
    "id": this.id,
    "image": this.image,
    "name": this.name,
    "date": this.date,
  };
}