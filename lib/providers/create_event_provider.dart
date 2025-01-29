import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
   List<String> eventCategories = [
    'birthday',
    'bookClub',
    'sport',
    'eating',
    'exhibition',
    'gaming',
    'meeting',
    'workshop',
    'other',
    'holiday'
  ];
  int selectedCategoryIndex = 0;
  var selectedDate = DateTime.now();
  

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }
  changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}