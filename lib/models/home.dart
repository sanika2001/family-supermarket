class Home {
  String image;
  String name;
  int id;

  Home({this.image, this.name, this.id});

  factory Home.fromDatabaseJson(Map<String, dynamic> data) => Home(
        //This will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Todo object
        id: data['id'],
        image: data['image'],
        name: data['name'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Todo objects that
        //are to be stored into the datbase in a form of JSON
        "id": this.id,
        "image": this.image,
        "name": this.name,
      };

//  Map<String, dynamic> toMap() {
//    var map = <String, dynamic>{
//      'id': _id,
//      'image': _image,
//      'name': _name,
//    };
//    return map;
//  }
//
//  Home.fromMap(Map<String, dynamic> map) {
//    _id = map['id'];
//    _image = map['image'];
//    _name = map['name'];
//  }
//
//  set id(int id) {
//    this._id = id;
//  }
//
//  set image(String image) {
//    this._image = image;
//  }
//
//  set name(String name) {
//    this._name = name;
//  }
//
//  int get id => this._id;
//  String get image => this._image;
//  String get name => this._name;
}
