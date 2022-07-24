import 'package:mercury_app/Models/coordenadas.dart';

class HotelInfo {
  //final String id;
  final String calles;
  final String imagen;
  final String nombre;
  final Coordenadas coordenadas;
  final String descripcion;
  final List<String> facilidades;
  final String ubicacion;

  const HotelInfo(
      {required this.nombre,
      required this.calles,
      //required this.id,
      required this.imagen,
      required this.ubicacion,
      required this.coordenadas,
      required this.descripcion,
      required this.facilidades});

  static HotelInfo fromJson(Map<String, dynamic> json) => HotelInfo(
        calles: json['calles'],
        coordenadas: Coordenadas.fromJson(json['coordenadas']),
        descripcion: json['descripcion'],
        imagen: json['imagen'],
        nombre: json['nombre'],
        ubicacion: json['ubicacion'],
        facilidades: List<String>.from(json["facilidades"].map((x) => x)),
        //id: json['id'],
      );
}
