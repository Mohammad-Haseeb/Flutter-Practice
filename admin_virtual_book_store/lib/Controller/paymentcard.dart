import 'package:flutter/cupertino.dart';

class PaymentCard {
  late String _paymentCardNumber;
  late int _cvc;
  late String _expiryDate;
  late String _holderName;

  PaymentCard(this._paymentCardNumber, this._cvc, this._expiryDate, this._holderName);

  set paymentCardNumber(String  value) {
    _paymentCardNumber = value;
  }

  String get paymentCardNumber => _paymentCardNumber;

  String get holderName => _holderName;

  String get expiryDate => _expiryDate;

  int get cvc => _cvc;

  set cvc(int value) {
    _cvc = value;
  }

  set expiryDate(String value) {
    _expiryDate = value;
  }

  set olderName(String value) {
    _holderName = value;
  }
}
