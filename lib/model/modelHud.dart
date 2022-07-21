import 'package:flutter/cupertino.dart';

class ModelHud extends ChangeNotifier
{
  bool isLoading =false;

  changeisLoading(bool value)
  {
    isLoading=value;
    notifyListeners();
  }
}

class AdminMode extends ChangeNotifier
{
  bool isAdmin =false ;
  changeIsAdmin(bool value )
  {
    isAdmin=value;
    notifyListeners();
  }
}