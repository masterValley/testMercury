
class Reserva {
  final String? codigoReserva; //
  final String? nombre; //
  final int? precio; //
  final String? numeroCamas; //
  final String? tamao; //
  final String? numeroHabitacion; //
  final String? capacidad; //
  final String? correoCliente; //
  final int? diasReserva; //
  final String? estado; //
  final int? fechaEntrada; //
  final int? fechaSalida; //
  final String? nombreCliente; //
  final String? nombreHotel; //


  const Reserva(
      {required this.codigoReserva,
      required this.nombre,
      required this.precio,
      required this.numeroCamas,
      required this.tamao,
      required this.numeroHabitacion,
      required this.capacidad,
      required this.correoCliente,
      required this.diasReserva,
      required this.estado,
      required this.fechaEntrada,
      required this.fechaSalida,
      required this.nombreCliente,
      required this.nombreHotel
      });

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        codigoReserva: json['codigoReserva'],
        nombre: json["nombreHabitacion"],
        precio: json["precio"],
        numeroCamas: json["camas"],
        tamao: json["tamañoHabitacion"],
        numeroHabitacion: json["numeroHabitacion"],
        capacidad: json["capacidad"], 
        correoCliente: json["correoCliente"],
        diasReserva: json["diasReserva"],
        estado: json["estado"],
        fechaEntrada: json["fechaEntrada"],
        fechaSalida: json["fechaSalida"],
        nombreCliente: json["nombreCliente"],
        nombreHotel: json["nombreHotel"]
      );

    Map toMap() {
      var map =  {};
      map['codigoReserva'] = codigoReserva;
      map['nombreHabitacion'] = nombre;
      map['precio'] = precio;
      map['camas'] = numeroCamas;
      map['tamañoHabitacion'] = tamao;
      map['numeroHabitacion'] = numeroHabitacion;
      map['capacidad'] = capacidad;
      map['correoCliente'] = correoCliente;
      map['diasReserva'] = diasReserva;
      map['estado'] = estado;
      map['fechaEntrada'] = fechaEntrada;
      map['fechaSalida'] = fechaSalida;
      map['nombreCliente'] = nombreCliente;
      map['nombreHotel'] = nombreHotel;
      return map;
    }
}
