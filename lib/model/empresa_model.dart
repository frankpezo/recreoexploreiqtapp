//1. Declaramos la clase
class EmpresaModel {
  int? idEmpresa;
  String? nombreEmpresa;
  String? emailEmpresa;
  String? passwordEmpresa;
  String? imgEmpresa;
  //1.1. Constructor
  EmpresaModel(
      {this.idEmpresa,
      this.nombreEmpresa,
      this.emailEmpresa,
      this.passwordEmpresa,
      this.imgEmpresa});

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
//2.2. Convertimos el modelo a un mapa
  Map<String, dynamic> toMap() {
    return {
      'idEmpresa': idEmpresa, // Asegúrate de incluir el ID aquí
      'nombreEmpresa': nombreEmpresa,
      'emailEmpresa': emailEmpresa, // Corrige el nombre de la columna
      'passwordEmpresa': passwordEmpresa,
      'imgEmpresa': imgEmpresa
    };
  }
}
