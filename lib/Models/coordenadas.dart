class Coordenadas {
  Coordenadas({
    required this.logitud,
    required this.latitud,
  });

  final double logitud;
  final double latitud;

  static Coordenadas fromJson(Map<String, dynamic> json) => Coordenadas(
        logitud: json['logitud'].toDouble(),
        latitud: json['latitud'].toDouble(),
      );
}
