
class User {

  String? nombre;
  String? apellido;
  int? id;
  String? nombreCompleto;
  String dni;
  String? telefono;
  String? direccion;
  String? password;
  String? tokern;

  User({
    this.nombre,
    this.apellido,
    this.id,
    this.nombreCompleto,
    required this.dni,
    this.telefono,
    this.direccion,
    this.password,
    this.tokern,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    nombre: json["nombre"],
    apellido: json["apellido"],
    id: json["id"],
    nombreCompleto: json["nombreCompleto"],
    dni: json["dni"],
    telefono: json["telefono"],
    direccion: json["direccion"],
    //password: json["password"],
    tokern: json["tokern"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "apellido": apellido,
    "id": id,
    "nombreCompleto": nombreCompleto,
    "dni": dni,
    "telefono": telefono,
    "direccion": direccion,
    "password": password,
    "tokern": tokern,
  };
}
