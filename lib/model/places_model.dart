class PlaceModel {
  // Atributos
  int? idLocal;
  String? nombrePlace;
  String? direPlace;
  String? distritoPlace;
  String? phonePlace;
  String? horarioPlace;
  String? descriptionPlace;
  List<String>? palabrasClavesP;
  String? nino_price;
  String? adulto_price;
  String? turista_price;
  String? feriado_price;
  String? estadoPlace;
  String? imagePlace;

  // Constructor
  PlaceModel(
      {this.idLocal,
      this.nombrePlace,
      this.direPlace,
      this.distritoPlace,
      this.phonePlace,
      this.horarioPlace,
      this.descriptionPlace,
      this.palabrasClavesP,
      this.nino_price,
      this.adulto_price,
      this.turista_price,
      this.feriado_price,
      this.estadoPlace,
      this.imagePlace});

  // Lógica de sqlite
  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
        idLocal: map['idLocal'],
        nombrePlace: map['nombreLocal'],
        direPlace: map['direccionLocal'],
        distritoPlace: map['distritoLocal'],
        phonePlace: map['telefonoLocal'],
        horarioPlace: map['horarioLocal'],
        descriptionPlace: map['descripcionLocal'],
        palabrasClavesP: (map['palabrasClaves'] as String?)
            ?.split(', '), // Convertir cadena a lista
        nino_price: map['ninoPrice'],
        adulto_price: map['adultoPrice'],
        turista_price: map['turistaPrice'],
        feriado_price: map['feriadoPrice'],
        estadoPlace: map['estadoLocal'],
        imagePlace: map['imageLocal']);
  }

  Map<String, dynamic> toMap() {
    // Convertir la lista de palabras clave a una cadena
    String palabrasClavesString = palabrasClavesP?.join(', ') ?? '';
    return {
      'idLocal': idLocal,
      'nombreLocal': nombrePlace,
      'direccionLocal': direPlace,
      'distritoLocal': distritoPlace,
      'telefonoLocal': phonePlace,
      'horarioLocal': horarioPlace,
      'descripcionLocal': descriptionPlace,
      'palabrasClaves':
          palabrasClavesString, // Guardar como cadena en la base de datos
      'ninoPrice': nino_price,
      'adultoPrice': adulto_price,
      'turistaPrice': turista_price,
      'feriadoPrice': feriado_price,
      'estadoLocal': estadoPlace,
      'imageLocal': imagePlace
    };
  }
}
