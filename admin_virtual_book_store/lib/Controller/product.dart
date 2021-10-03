class Prodcut {
  late String _name;
  late String _description;
  late String _Category;
  late String _prize;
  int _reviews=0;
  late bool _onlineAvailabilty;
  late String _totalBooksAvailable;
  late String _OwnerId;
  late String _image;
  int _remaingBooksLot = 0;
  String get image => _image;

  set image(String value) {
    _image = value;
  }


  String get OwnerId => _OwnerId;

  set OwnerId(String value) {
    _OwnerId = value;
  }


  String get name => _name;

  int get remaingBooksLot => _remaingBooksLot;

  set remaingBooksLot(int value) => _remaingBooksLot = value;

  set name(String value) {
    _name = value;
  }

  bool get onlineAvailabilty => _onlineAvailabilty;

  set onlineAvailabilty(bool value) {
    _onlineAvailabilty = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get Category => _Category;

  set Category(String value) {
    _Category = value;
  }

  String get totalBooksAvailable => _totalBooksAvailable;

  set totalBooksAvailable(String value) {
    _totalBooksAvailable = value;
  }

  String get prize => _prize;

  set prize(String value) {
    _prize = value;
  }

  int get reviews => _reviews;

  set reviews(int value) {
    _reviews = value;
  }

}
