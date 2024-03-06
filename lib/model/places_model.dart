//1. Creamos la clase para el registro
class PlaceModel {
  // Atributos
  int? idLocal;
  String? imagePlace;
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
  //int? idEmpresa;
  // Sring rakingPlace;
  //Map<String, String> catePlace;
  // List<Map<String, dynamic>> comentPlace;

  // Constructor
  PlaceModel({
    this.idLocal,
    this.imagePlace,
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
    //  this.idEmpresa //idmpresa
  });

  //2. Lógica de sqlite
  //2.1.
  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
        idLocal: map['idLocal'],
        imagePlace: map['imageLocal'],
        nombrePlace: map['nombreLocal'],
        direPlace: map['direccionLocal'],
        distritoPlace: map['distritoLocal'],
        phonePlace: map['telefonoLocal'],
        horarioPlace: map['horarioLocal'],
        descriptionPlace: map['descripcionLocal'],
        palabrasClavesP: map['palabrasClaves'],
        nino_price: map['ninoPrice'],
        adulto_price: map['adultoPrice'],
        turista_price: map['turistaPrice'],
        feriado_price: map['feriadoPrice'],
        estadoPlace: map['estadoLocal']);
    // idEmpresa: map['idEmpresa']);
  }

  //2.2.
  Map<String, dynamic> toMap() {
    return {
      'idLocal': idLocal,
      'imageLocal': imagePlace,
      'nombreLocal': nombrePlace,
      'direccionLocal': direPlace,
      'distritoLocal': distritoPlace,
      'telefonoLocal': phonePlace,
      'horarioLocal': horarioPlace,
      'descripcionLocal': descriptionPlace,
      'palabrasClaves': palabrasClavesP,
      'ninoPrice': nino_price,
      'adultoPrice': adulto_price,
      'turistaPrice': turista_price,
      'feriadoPrice': feriado_price,
      'estadoLocal': estadoPlace,
      //'idEmpresa': idEmpresa
    };
  }
}
