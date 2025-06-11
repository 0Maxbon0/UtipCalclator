import 'package:flutter/foundation.dart';

class TipCalculatorModel with ChangeNotifier {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  int get personCount => _personCount;
  double get tipPercentage => _tipPercentage;
  double get billTotal => _billTotal;
  double get totalPerPerson =>
      (((_billTotal * _tipPercentage) + _billTotal) / _personCount);

  void updateBillTotal(double billTotal) {
    _billTotal = billTotal;
    notifyListeners();
  }

  void updateTipPercentage(double tipPercentage) {
    _tipPercentage = tipPercentage;
    notifyListeners();
  }

  void updatePersonCount(int personCount) {
    _personCount = personCount;
    notifyListeners();
  }
}
