//1. Declaramos la clase
class EmpresaModel {
  int id;
  String nombreEmpresa;
  String emailEmpresa;
  String passwordEmpresa;
  String img;
  //1.1. Constructor
  EmpresaModel(
      {required this.id,
      required this.nombreEmpresa,
      required this.emailEmpresa,
      required this.passwordEmpresa,
      required this.img});
}
