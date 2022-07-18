import 'package:flutter/material.dart';
import 'package:mercury_app/Home/home.dart';
import 'package:provider/provider.dart';

import 'Providers/_providerhotel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HotelProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mercury Booking',
        theme: ThemeData(),
        home: const HomeStart(),
      ),
    );
  }
}
