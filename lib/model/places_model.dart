class PlaceModel {
  // Atributos
  int id;
  String imagePlace;
  String nombrePlace;
  String direPlace;
  String distritoPlace;
  int phonePlace;
  List<String> palabrasClavesP;
  double nino_price;
  double adulto_price;
  double turista_price;
  double feriado_price;
  String horarioPlace;
  String estadoPlace;
  double rakingPlace;
  String descriptionPlace;
  Map<String, String> catePlace;
  List<Map<String, dynamic>> comentPlace;

  // Constructor
  PlaceModel(
      {required this.id,
      required this.imagePlace,
      required this.nombrePlace,
      required this.direPlace,
      required this.distritoPlace,
      required this.phonePlace,
      required this.palabrasClavesP,
      required this.nino_price,
      required this.adulto_price,
      required this.turista_price,
      required this.feriado_price,
      required this.horarioPlace,
      required this.estadoPlace,
      required this.rakingPlace,
      required this.descriptionPlace,
      required this.catePlace,
      required this.comentPlace});

  // Otros métodos si los tienes
}
