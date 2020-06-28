class Products{
  String _image;

  Products(this._image);

  set image(String image) {
    this._image = image;
  }

  String get image => this._image;
}