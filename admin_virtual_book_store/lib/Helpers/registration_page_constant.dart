import 'package:form_field_validator/form_field_validator.dart';




final KEmailValidator=MultiValidator([
  RequiredValidator(errorText: "Reuired"),
  EmailValidator(errorText: 'enter a valid email address')

]);

final KPhoneNumberValidaor= MultiValidator([
  RequiredValidator(errorText: 'phoneNumber is required'),
  MinLengthValidator(7, errorText: 'Invalid Phone Number'),
  MaxLengthValidator(17, errorText: 'Invalid Phone Number'),

]);

final KPasswordValidator=MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
]);

final KAddressValidator=MultiValidator([
  RequiredValidator(errorText: 'address is required'),
  MinLengthValidator(8, errorText: 'Too short Address'),
  MaxLengthValidator(32, errorText: 'Too long Address'),

]);

final KNameValidator= MultiValidator([
  RequiredValidator(errorText: 'Name is  '),
  MinLengthValidator(8, errorText: 'Too short'),
  MaxLengthValidator(20, errorText: 'Too long'),
]);