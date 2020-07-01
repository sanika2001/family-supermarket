class Rice {
  String _image;
  String _ricename;
  String _price;
  String _rate;

  Rice(this._image, this._ricename, this._price, this._rate);

  set image(String image) {
    this._image = image;
  }

  set ricename(String ricename) {
    this._ricename = ricename;
  }

  set price(String price) {
    this._price = price;
  }

  set rate(String rate) {
    this._rate = rate;
  }

  String get image => this._image;
  String get ricename => this._ricename;
  String get price => this._price;
  String get rate => this._rate;
}
