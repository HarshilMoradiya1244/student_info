import 'package:flutter/cupertino.dart';
import 'package:student_info/screen/data_screen.dart';
import 'package:student_info/screen/home_screen.dart';

Map<String,WidgetBuilder>Screen_Routes = {

  '/':(context) => HomeScreen(),
  'data':(context) => DataScreen(),
};