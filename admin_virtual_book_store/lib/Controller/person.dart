class Person {
  late String _name;
  late String _phoneNumber;
  late String _email;
  late String _password;
  late String _address;

Person.named(){
  print("String Person");

}
  void AllInfoSetter(
       String username,
       String phoneNumber,
       String email,
       String password,
       String address,
    ) {

    print("USer Person"+username);
    this.phoneNumber = phoneNumber;
    this.email = email;
    this.name=username;

    this.password = password;
    this.address = address;


  }


  String getphoneNumber() => _phoneNumber;

  String getEmail() => _email;

  String getPassword() => _password;

  String getAddress() => _address;

  String getStatus() => "Seller";

  String getpayment() => _address;



  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  set address(String value) {
    _address = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
