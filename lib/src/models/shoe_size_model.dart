import 'package:flutter/material.dart';

class ShoeSizeModel extends ChangeNotifier {
  int _selectedSizeId = 5;

  int get selectedSizeId => this._selectedSizeId;

  set selectedSize(int size) {
    this._selectedSizeId = size;
    notifyListeners();
  }
}
