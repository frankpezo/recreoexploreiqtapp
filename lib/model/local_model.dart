class LocalModel {
  // Atributos
  int? idLocal;
  String? imageLocal;
  String? nombreLocal;
  String? direccionLocal;
  String? distritoLocal;
  String? telefonoLocal;
  String? horarioLocal;
  String? descripcionLocal;
  List<String>? palabrasClaves;
  String? ninoPrice;
  String? adultoPrice;
  String? turistaPrice;
  String? feriadoPrice;
  String? estadoLocal;
  int? idEmpresa;

  // Constructor
  LocalModel(
      {this.idLocal,
      this.imageLocal,
      this.nombreLocal,
      this.direccionLocal,
      this.distritoLocal,
      this.telefonoLocal,
      this.horarioLocal,
      this.descripcionLocal,
      this.palabrasClaves,
      this.ninoPrice,
      this.adultoPrice,
      this.turistaPrice,
      this.feriadoPrice,
      this.estadoLocal,
      this.idEmpresa});

  // Lógica de sqlite
  factory LocalModel.fromMap(Map<String, dynamic> map) {
    return LocalModel(
        idLocal: map['idLocal'],
        imageLocal: map['imageLocal'],
        nombreLocal: map['nombreLocal'],
        direccionLocal: map['direccionLocal'],
        distritoLocal: map['distritoLocal'],
        telefonoLocal: map['telefonoLocal'],
        horarioLocal: map['horarioLocal'],
        descripcionLocal: map['descripcionLocal'],
        palabrasClaves: (map['palabrasClaves'] as String?)
            ?.split(', '), // Convertir cadena a lista
        ninoPrice: map['ninoPrice'],
        adultoPrice: map['adultoPrice'],
        turistaPrice: map['turistaPrice'],
        feriadoPrice: map['feriadoPrice'],
        estadoLocal: map['estadoLocal'],
        idEmpresa: map['idEmpresa']);
  }

  Map<String, dynamic> toMap() {
    // Convertir la lista de palabras clave a una cadena
    String palabrasClavesString = palabrasClaves?.join(', ') ?? '';
    return {
      'idLocal': idLocal,
      'imageLocal': imageLocal,
      'nombreLocal': nombreLocal,
      'direccionLocal': direccionLocal,
      'distritoLocal': distritoLocal,
      'telefonoLocal': telefonoLocal,
      'horarioLocal': horarioLocal,
      'descripcionLocal': descripcionLocal,
      'palabrasClaves':
          palabrasClavesString, // Guardar como cadena en la base de datos
      'ninoPrice': ninoPrice,
      'adultoPrice': adultoPrice,
      'turistaPrice': turistaPrice,
      'feriadoPrice': feriadoPrice,
      'estadoLocal': estadoLocal,
      'idEmpresa': idEmpresa
    };
  }
}
