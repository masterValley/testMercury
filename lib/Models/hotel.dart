

class Hotel {
  
  final String id;
  final String calles;
  final String imagen;
  final String nombre;

  const Hotel(
      {required this.nombre,
      required this.calles,
      required this.id,
      required this.imagen});

  static Hotel fromJson(Map<String, dynamic> json) => Hotel(
      nombre: json['nombre'],
      calles: json['calles'],
      id: json['id'],
      imagen: json['imagen'],
    );
}
