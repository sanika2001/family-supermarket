class Cart {
  String image;
  String name;
  String rate;
  int id;
  int qty;

  Cart({this.image, this.name, this.rate, this.id, this.qty});

  factory Cart.fromDatabaseJson(Map<String, dynamic> data) => Cart(
        id: data['id'],
        image: data['image'],
        name: data['name'],
        rate: data['rate'],
        qty: data['qty'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert
        //are to be stored into the database in a form of JSON
        "id": this.id,
        "image": this.image,
        "name": this.name,
        "rate": this.rate,
        "qty": this.qty,
      };
}
