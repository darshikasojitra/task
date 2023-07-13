import 'package:flutter/cupertino.dart';

class GenderProvider extends ChangeNotifier{
  String gender = 'male';

  void changeGender(String value){
    gender = value;
    notifyListeners();
  }
}