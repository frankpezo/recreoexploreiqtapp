import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/pages/user/viewCardUser.dart';

class YourWidget extends StatefulWidget {
  //1. Traemos el model de los datos del local
  final PlaceModel place;
  final ModelUser userCard;

  YourWidget({required this.place, required this.userCard});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  //2. Creamos un favorito para que se pueda hacer el cambio
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return buildPlaceCard(context, widget.place);
  }

//3. Crearemos un widget que servirá de retorno en cada categoría
  Widget buildPlaceCard(BuildContext context, PlaceModel place) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewCardUser(
              placeView: place,
              userView: widget.userCard,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(18.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3.1. Imagen del lugar con bordes redondeados
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/${place.imagePlace}',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              //id
              Visibility(visible: false, child: Text("${place.idLocal}")),
              SizedBox(width: 10.0), // Espacio entre la imagen y el texto
              // 3.2. Contenido del lugar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 3.3. Nombre del lugar y ranking
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${place.nombrePlace}',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text('4'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    // .4. Dirección con icono
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red, size: 16.0),
                        SizedBox(width: 5.0),
                        Text(
                          '${place.direPlace}',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    //3.5.  Horario de atención con icono
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            color: Color(0xFF238F8F), size: 16.0),
                        SizedBox(width: 5.0),
                        Text(
                          '${place.horarioPlace}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          //2.2. Realizamos una condicional para hacer el cambio de estado
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                    // 3.6. Estado centrado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //Realizamos una condicional para hacer el cambio de estado
                          '${place.estadoPlace}',
                          style: TextStyle(
                            color: place.estadoPlace == "Abierto"
                                ? Colors.green
                                : Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
