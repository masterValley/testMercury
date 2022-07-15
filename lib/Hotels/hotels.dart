import 'package:flutter/material.dart';
import 'package:mercury_app/Providers/providerHotel.dart';
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
        appBar: AppBar(),
        body: Center(
          child: Consumer<HotelProvider>(
            builder: (context, HotelProvider data, child) {
              return Center(
                  child: Text(
                      "${data.getHotels.destino} ${data.getHotels.start} ${data.getHotels.end}"));
            },
          ),
        ));
  }
}
