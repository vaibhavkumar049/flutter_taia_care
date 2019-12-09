import 'package:flutter/cupertino.dart';

class LibraryViewModel extends ChangeNotifier{
  String _selectedCategory;
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  setIsSelected(bool value) {
    _isSelected = value;
    notifyListeners();
  }

  String get selectedCategory => _selectedCategory;

  setSelectedCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }

}