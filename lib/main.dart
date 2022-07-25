import 'package:flutter/material.dart';
import 'package:mercury_app/Home/home.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Providers/_provideruser.dart';
import 'package:provider/provider.dart';

import 'Providers/_providerhotel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelProvider()),
        ChangeNotifierProvider(create: (context) => HotelInfoProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => RoomProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mercury Booking',
        theme: ThemeData(),
        home: const HomeStart(),
      ),
    );
  }
}
