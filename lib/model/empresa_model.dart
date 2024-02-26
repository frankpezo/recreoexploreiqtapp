//1. Declaramos la clase
class EmpresaModel {
  int idEmpresa;
  String nombreEmpresa;
  String emailEmpresa;
  String passwordEmpresa;
  String imgEmpresa;
  //1.1. Constructor
  EmpresaModel(
      {required this.idEmpresa,
      required this.nombreEmpresa,
      required this.emailEmpresa,
      required this.passwordEmpresa,
      required this.imgEmpresa});

  //2. Veremos la lógica del sqlLite
  //2.1. LLenamos los campos
  factory EmpresaModel.fromMap(Map<String, dynamic> map) {
    //Retornamos los campos de la bd
    return EmpresaModel(
        idEmpresa: map['idEmpresa'],
        nombreEmpresa: map['nombreEmpresa'],
        emailEmpresa: map['emailEmpresa'],
        passwordEmpresa: map['passwordEmpresa'],
        imgEmpresa: map['imgEmpresa']);
  }
  //2.2.
  Map<String, dynamic> toMap() {
    return {
      'idEmpresa': idEmpresa,
      'nombreEmpresa': nombreEmpresa,
      'emailEmpresas': emailEmpresa,
      'passwordEmpresa': passwordEmpresa,
      'imgEmpresa': imgEmpresa
    };
  }
}
