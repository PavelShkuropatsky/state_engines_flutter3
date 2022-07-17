import 'package:flutter/material.dart';
import '../pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.green
    ),
    home: HomePage(),
  ));
}