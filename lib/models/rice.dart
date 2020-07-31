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

//  set image(String image) {
//    this._image = image;
//  }
//
//  set ricename(String ricename) {
//    this._ricename = ricename;
//  }
//
//  set price(String price) {
//    this._price = price;
//  }
//
//  set rate(String rate) {
//    this._rate = rate;
//  }
//
//  set pressed(bool pressed) {
//    this._pressed = pressed;
//  }
//
//  set qty(int qty) {
//    this._qty = qty;
//  }
//
//  String get image => this._image;
//  String get ricename => this._ricename;
//  String get price => this._price;
//  String get rate => this._rate;
//  bool get pressed => this._pressed;
//  int get qty => this._qty;
}
