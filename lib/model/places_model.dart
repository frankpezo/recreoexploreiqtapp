//1. Esta clase será mostrada para los card
class PlaceModel {
  //1.1. Declaramos los atributos
  int id;
  String imagePlace;
  String nombrePlace;
  String direPlace;
  String horarioPlace;
  String estadoPlace;
  double rakingPlace;

  //1.2. Constructor
  PlaceModel(
      {required this.id,
      required this.imagePlace,
      required this.nombrePlace,
      required this.direPlace,
      required this.horarioPlace,
      required this.estadoPlace,
      required this.rakingPlace});
}
