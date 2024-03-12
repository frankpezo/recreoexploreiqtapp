//1. Creamos la clase de usuario
class ModelUser {
  //1.1. Declaramos los atributos
  int? idUser;
  String? nombreUser;
  String? apellidoUser;
  String? emailUser;
  String? passwordUser;
  String? imgUser;

  //1.2. Creamos el constructor
  ModelUser(
      {this.idUser,
      this.nombreUser,
      this.apellidoUser,
      this.emailUser,
      this.passwordUser,
      this.imgUser});

  //2. Creamos la lógica para poder usarlo con la base de datos
  //2.1. sqlite
  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
        idUser: map['idUser'],
        nombreUser: map['nombreUser'],
        apellidoUser: map['apellidoUser'],
        emailUser: map['emailUser'],
        passwordUser: map['passwordUser'],
        imgUser: map['imgUser']);
  }
  //2.2.  Recorrer el mapa
  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'nombreUser': nombreUser,
      'apellidoUser': apellidoUser,
      'emailUser': emailUser,
      'passwordUser': passwordUser,
      'imgUser': imgUser
    };
  }
}
