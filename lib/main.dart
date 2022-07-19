import 'package:flutter/material.dart';
import 'package:mercury_app/Home/home.dart';

import 'Payment/WisePay/wise_pay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mercury Booking',
      theme: ThemeData(
        
      ),
      home: const HomeStart(),
    );
  }
}

