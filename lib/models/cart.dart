class Cart {
  String _image;
  String _name;
  String _rate;

  Cart(this._image, this._name, this._rate);

  set image(String image) {
    this._image = image;
  }

  set name(String name) {
    this._name = name;
  }

  set rate(String rate) {
    this._rate = rate;
  }

  String get image => this._image;
  String get name => this._name;
  String get rate => this._rate;
}
