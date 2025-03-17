import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp( // <-- Tambahin ini
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Konversi Suhu",
      home: MyLoginPage(),
    ),
  );
}
