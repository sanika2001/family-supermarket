class Home {

  String _image;
  String _name;

  Home(this._image,this._name);
  set image(String image) {
    this._image = image;
  }

  set name(String name) {
    this._name = name;
  }

  String get image => this._image;
  String get name => this._name;
}