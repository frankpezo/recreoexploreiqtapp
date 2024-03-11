import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';

class PunchanaCate extends StatefulWidget {
  final ModelUser? usersPun;
  final int? idUserPun;
  final String? emailUserPun;
  PunchanaCate({Key? key, this.usersPun, this.idUserPun, this.emailUserPun})
      : super(key: key);

  @override
  State<PunchanaCate> createState() => _PunchanaCateState();
}

class _PunchanaCateState extends State<PunchanaCate> {
  //1. Colocamos la lógica para traer los locales
  bool isFavorite = false;
  //1. Creamos lista para que se muestre  la lista
  List<LocalModel> localPunchana = [];

  //1.1. Inicializamos
  @override
  void initState() {
    super.initState();
    //Ponemos aquí
    _cargarLocalPunchana();
  }

  //2. Función que no Permitirá traer la lista
  Future<void> _cargarLocalPunchana() async {
    List<Map<String, dynamic>> listLocal =
        await Databasehelper.instance.traerLocalesDistrito('Punchana');
    List<LocalModel> local =
        listLocal.map((ele) => LocalModel.fromMap(ele)).toList();
    //Inicaializamos
    setState(() {
      localPunchana = local;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //2. Hacemos la lógica para la lista de visualizar las cateogrías
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: localPunchana.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewCardUser(
                        placeView: place,
                        userView: widget.userCard,
                      ),
                    ),
                  ); */
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
                            '${localPunchana[index].imageLocal}',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        //id
                        Visibility(
                            visible: false,
                            child: Text("${localPunchana[index].idLocal}")),
                        SizedBox(
                            width: 10.0), // Espacio entre la imagen y el texto
                        // 3.2. Contenido del lugar
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 3.3. Nombre del lugar y ranking
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${localPunchana[index].nombreLocal}',
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
                                  Icon(Icons.location_on,
                                      color: Colors.red, size: 16.0),
                                  SizedBox(width: 5.0),
                                  Text(
                                    '${localPunchana[index].direccionLocal}',
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
                                    '${localPunchana[index].horarioLocal}',
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
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
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
                                    '${localPunchana[index].estadoLocal}',
                                    style: TextStyle(
                                      color: localPunchana[index].estadoLocal ==
                                              "Abierto"
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
            }));
  }
}
