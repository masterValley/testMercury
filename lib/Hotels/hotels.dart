import 'package:flutter/material.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:provider/provider.dart';

class HotelsList extends StatefulWidget {
  const HotelsList({Key? key}) : super(key: key);

  @override
  State<HotelsList> createState() => _HotelsListState();
}

class _HotelsListState extends State<HotelsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff191C25),
          foregroundColor: const Color(0xfff2f2f2),
        ),
        body: Center(
          child: Consumer<HotelProvider>(
            builder: (context, HotelProvider data, child) {
              return Center(
                  child: Text(
                      "${data.getHotels.destino} ${data.getHotels.start} ${data.getHotels.end} ${data.getstart} ${data.getend}"));
            },
          ),
        ));
  }
}
