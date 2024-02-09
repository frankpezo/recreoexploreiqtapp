//1. Creamos la clase de usuario
class ModelUser {
  //1.1. Declaramos los atributos
  int id;
  String nombreUser;
  String apellidoUser;
  String emailUser;
  String passwordUser;
  String imgUser;

  //1.2. Creamos el constructor
  ModelUser(
      {required this.id,
      required this.nombreUser,
      required this.apellidoUser,
      required this.emailUser,
      required this.passwordUser,
      required this.imgUser});
}
