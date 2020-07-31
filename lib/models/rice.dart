class Rice {
  String image;
  String ricename;
  String price;
  String rate;
  int pressed;
  int qty;

  Rice(
      {this.image,
      this.ricename,
      this.price,
      this.rate,
      this.pressed,
      this.qty});

  factory Rice.fromDatabaseJson(Map<String, dynamic> data) => Rice(
        image: data['image'],
        ricename: data['ricename'],
        price: data['price'],
        rate: data['rate'],
        pressed: data['pressed'],
        qty: data['qty'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "image": this.image,
        "ricename": this.ricename,
        "price": this.price,
        "rate": this.rate,
        "pressed": this.pressed,
        "qty": this.qty,
      };
}
