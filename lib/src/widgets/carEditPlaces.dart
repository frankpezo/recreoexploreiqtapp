import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/viewAdminCard.dart';

class YourWidgetEditP extends StatefulWidget {
  final int? idEEP;
  final LocalModel? localEEP;
  final EmpresaModel? empresaEEP;
  YourWidgetEditP({
    Key? key,
    this.idEEP,
    this.localEEP,
    this.empresaEEP,
  }) : super(key: key);

  @override
  State<YourWidgetEditP> createState() => _YourWidgetEditPState();
}

class _YourWidgetEditPState extends State<YourWidgetEditP> {
  //1. Creamos un favorito para que se pueda hacer el cambio
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return buildPlaceCard(context, widget.localEEP!);
  }

  //3. Crearemos un widget que servirá de retorno en cada categoría
  @override
  Widget buildPlaceCard(BuildContext context, LocalModel local) {
    return GestureDetector(
      onTap: () {
        ;
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
                  'assets/images/${local.imageLocal}',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              //id
              Visibility(visible: false, child: Text("${local.idLocal}")),
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
                          '${local.nombreLocal}',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          //Realizamos una condicional para hacer el cambio de estado
                          '${local.estadoLocal}',
                          style: TextStyle(
                            color: local.estadoLocal == "Abierto"
                                ? Colors.green
                                : Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    //3.5.  Horario de atención con icono

                    SizedBox(height: 14.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Aquí puedes agregar la lógica para editar
                            /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewCardAdmin(
                                  placeViewA: place,
                                  userViewA: widget.userC,
                                ),
                              ),
                            ); */
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Aquí puedes agregar la lógica para editar el perfil
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.delete,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 3.6. Estado centrado
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
