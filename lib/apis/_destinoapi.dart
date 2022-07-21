import 'dart:convert';

import '../Models/_destino.dart';
import 'package:http/http.dart' as http;

class DestinoApi {
  static Future<List<Destino>> getDestinosSuggestions(String query) async {
    final url = Uri.parse(
        'https://ws.api.location-world.com/Location.ashx?function=GetCitiesContains&prefix=$query&token=8008DC45EF07DEF012A39B88F5DDDCEF74E80FF0');
    final response = await http.get(url, headers: {'Content-Type': 'application/json', 
        "Access-Control-Allow-Origin": "*",});

    if (response.statusCode == 200) {
      final List destinos = json.decode(response.body);

      return destinos.map((json) => Destino.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}
