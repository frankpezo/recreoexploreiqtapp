import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/pages/user/viewCardUser.dart';

class BelenCate extends StatefulWidget {
  final ModelUser? userBe;
  final int? idUserBe;
  final String? emailUserBe;
  BelenCate({Key? key, this.userBe, this.idUserBe, this.emailUserBe})
      : super(key: key);

  @override
  State<BelenCate> createState() => _BelenCateState();
}

class _BelenCateState extends State<BelenCate> {
  //1. Colocamos la lógica para traer los locales
  bool isFavorite = false;
  //1. Creamos lista para que se muestre  la lista
  List<LocalModel> localBelen = [];

  //1.1. Inicializamos
  @override
  void initState() {
    super.initState();
    //Ponemos aquí
    _cargarLocalBelen();
  }

  //2. Función que no Permitirá traer la lista
  Future<void> _cargarLocalBelen() async {
    List<Map<String, dynamic>> listLocal =
        await Databasehelper.instance.traerLocalesDistrito('Belén');
    List<LocalModel> local =
        listLocal.map((ele) => LocalModel.fromMap(ele)).toList();
    //Inicaializamos
    setState(() {
      localBelen = local;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //2. Hacemos la lógica para la lista de visualizar las cateogrías
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: localBelen.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewCardUser(
                        userVC: widget.userBe,
                        idUserVC: widget.idUserBe,
                        emailUserVc: widget.emailUserBe,
                        idLocalVC: localBelen[index].idLocal,
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
                            '${localBelen[index].imageLocal}',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        //id
                        Visibility(
                            visible: false,
                            child: Text("${localBelen[index].idLocal}")),
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
                                    '${localBelen[index].nombreLocal}',
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
                                    '${localBelen[index].direccionLocal}',
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
                                    '${localBelen[index].horarioLocal}',
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
                                    '${localBelen[index].estadoLocal}',
                                    style: TextStyle(
                                      color: localBelen[index].estadoLocal ==
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
