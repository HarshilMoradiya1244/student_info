import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_info/utils/app_routes.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: Screen_Routes,
    )
  );
}