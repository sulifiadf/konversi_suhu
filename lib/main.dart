import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:provider/provider.dart';
import 'providers/login_providers.dart';
import 'providers/suhu_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SuhuProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Konversi Suhu",
      home: MyLoginPage(),
    );
  }
}
