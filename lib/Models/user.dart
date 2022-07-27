class User {
  final String names;
  final String lastNames;
  final String email;
  final String CI;

  User({required this.names, required this.lastNames, required this.email, required this.CI});

  factory User.fromJson(Map<String, dynamic> json) => User(
    names: json['nombre'],
    lastNames: json['apellido'],
    email: json['correo'],
    CI: json['ci']
  );

  Map toMap() {
    var map = new Map();
    map['apellido'] = lastNames;
    map['ci'] = CI;
    map['correo'] = email;
    map['nombre'] = names;
    return map;
  }
}