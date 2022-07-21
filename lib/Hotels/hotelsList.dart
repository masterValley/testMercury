import 'package:flutter/material.dart';
import 'package:mercury_app/Hotels/listarHoteles.dart';
import 'package:mercury_app/Models/hotel.dart';

class HotelList extends StatelessWidget {
  final List<Hotel> hoteles;
  const HotelList({Key? key, required this.hoteles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff2f2f2),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(32.0),
          itemCount: hoteles.length,
          itemBuilder: (context, index) {
            return Center(child: HotelItem(hotel: hoteles[index]));
          }),
    );
  }
}
