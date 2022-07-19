class Destino {
  final String name;

  const Destino({
    required this.name,
  });

  static Destino fromJson(Map<String, dynamic> json) => Destino(
        name: json['Name'],
      );
}
