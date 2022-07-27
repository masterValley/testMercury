class Reserva {
  final int id; //
  final String nombre; //
  final int precio; //
  final int numeroCamas; //
  final String tamao; //
  final String numeroHabitacion; //
  final int capacidad; //
  final String correoCliente; //
  final int diasReserva; //
  final String estado; //
  final int fechaEntrada; //
  final int fechaSalida; //
  final String nombreCliente; //
  final String nombreHotel; 
  final String codigoReserva;

  const Reserva(
      {
      required this.id,
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
      required this.codigoReserva,
      required this.nombreHotel});

  factory Reserva.fromJson(Map<String, dynamic> json) {
    print(json);
    return Reserva(
      nombre: json['nombreHabitacion'],
      id : json['id'] ?? 1010,
      precio: json['precio'],
      numeroCamas: json['camas'],
      tamao: json['tamanioHabitacion'],
      numeroHabitacion: json['numeroHabitacion'],
      capacidad: json['capacidad'],
      correoCliente: json['correoCliente'],
      diasReserva: json['diasReserva'],
      estado: json['estado'],
      fechaEntrada: json['fechaEntrada'],
      fechaSalida: json['fechaSalida'],
      nombreCliente: json['nombreCliente'],
      codigoReserva: json['codigoReserva'],
      nombreHotel: json['nombreHotel']);
  } 

  Map toMap() {
    Map<String, dynamic> map = {};
    map['nombreHabitacion'] = nombre;
    map['id'] = id;
    map['precio'] = precio;
    map['camas'] = numeroCamas;
    map['tamanioHabitacion'] = tamao;
    map['numeroHabitacion'] = numeroHabitacion;
    map['capacidad'] = capacidad;
    map['correoCliente'] = correoCliente;
    map['diasReserva'] = diasReserva;
    map['estado'] = estado;
    map['fechaEntrada'] = fechaEntrada;
    map['fechaSalida'] = fechaSalida;
    map['nombreCliente'] = nombreCliente;
    map['codigoReserva'] = codigoReserva;
    map['nombreHotel'] = nombreHotel;
    return map;
  }

  
}
