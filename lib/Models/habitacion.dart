class Habitacion {
  final String id;
  final String nombre;
  final String politicaHumo;
  final int precio;
  final List<String> itemsBao;
  final int numeroCamas;
  final String tipoCamas;
  final int tamao;
  final List<String> itemsHabitacion;
  final List<String> facilidades;
  final String numeroHabitacion;
  final int capacidad;

  const Habitacion(
      {required this.id,
      required this.nombre,
      required this.politicaHumo,
      required this.precio,
      required this.itemsBao,
      required this.numeroCamas,
      required this.tipoCamas,
      required this.tamao,
      required this.itemsHabitacion,
      required this.facilidades,
      required this.numeroHabitacion,
      required this.capacidad});

  static Habitacion fromJson(Map<String, dynamic> json) => Habitacion(
        id: json['id'],
        nombre: json["nombre"],
        politicaHumo: json["politicaHumo"],
        precio: json["precio"],
        itemsBao: List<String>.from(json["itemsBaño"].map((x) => x)),
        numeroCamas: json["numeroCamas"],
        tipoCamas: json["tipoCamas"],
        tamao: json["tamaño"],
        itemsHabitacion:
            List<String>.from(json["itemsHabitacion"].map((x) => x)),
        facilidades: List<String>.from(json["facilidades"].map((x) => x)),
        numeroHabitacion: json["numeroHabitacion"],
        capacidad: json["capacidad"],
      );
}
