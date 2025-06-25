import 'package:currency_converter/currecny_converter_materialpage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

//matreialapp

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //by using material app we are tellin flutter we are creating a material app
    return MaterialApp(home: CurrecnyConverterMaterialpage());
  }
}

