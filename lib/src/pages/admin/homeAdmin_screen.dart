import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardRegister.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/viewAdminCard.dart';
import 'package:recreoexploreiqtapp/src/widgets/carEditPlaces.dart';

class HomeAdminScreen extends StatefulWidget {
  final EmpresaModel? empresaH;
  final int? idEA;
  final String? emailEA;
  HomeAdminScreen({
    Key? key,
    required this.empresaH,
    this.idEA,
    this.emailEA,
  }) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
  static List<PlaceModel> placeE = [
    PlaceModel(
      idLocal: 1,
      //imagePlace: "quis.jpg",
      nombrePlace: "Quistococha",
      direPlace: "Carretera Iquitos - Nauta, km 6.5",
      distritoPlace: 'San Juan Bautista',
      phonePlace: '9999999999',
      palabrasClavesP: ['playa', 'piscina', 'zoológico'],
      nino_price: '5.0',
      adulto_price: '10.0',
      turista_price: '15.0',
      feriado_price: '15.0',
      horarioPlace: "Lunes a domingo, 7:30am - 5:30pm",
      estadoPlace: "Abierto",
      /*  rakingPlace: 5.0,
      descriptionPlace:
          "Ubicado junto a la laguna que lleva el mismo nombre, este complejo  turístico cuenta con una playa artificial de arena blanca, un zoológico  con alrededor de 70 especies de animales amazónicos y un vivero  botánico, además de ofrecer una excelente gastronomía amazónica.",
      catePlace: {
        "Zoológico": '["7.jpg", "8.jpg", "9.jpg"]',
        "Playa": '["pquis1.jpg", "pquis2.jpg"]'
      },
      comentPlace: [
        {
          "id": 1,
          'profileImage': 'assets/images/profile.jpg',
          'username': 'Usuario 1',
          'comment': 'Comentario del usuario 1',
          'rating': 3.0,
        },
        {
          "id": 2,
          'profileImage': 'assets/images/profile.jpg',
          'username': 'Usuario 2',
          'comment': 'Comentario del usuario 2',
          'rating': 4.0,
        },
        // Puedes agregar más comentarios aquí
        {
          "id": 2,
          'profileImage': 'assets/images/profile.jpg',
          'username': 'Usuario 3',
          'comment': 'Comentario del usuario 3',
          'rating': 5.0,
        },
      ], */
    ),
  ];
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  int? idEmpresaa;
  List<LocalModel> usuarios = [];

  @override
  void initState() {
    super.initState();
    _cargarUsuarios();
  }

  Future<void> _cargarUsuarios() async {
    List<Map<String, dynamic>> listaUsuarios =
        await Databasehelper.instance.traerLocales(widget.idEA);
    List<LocalModel> empresa =
        listaUsuarios.map((ele) => LocalModel.fromMap(ele)).toList();
    setState(() {
      usuarios = empresa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
            30), // Reducir el padding para dispositivos más pequeños
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo y título
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0), // Añadir espacio vertical
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/icon2.1.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'RecreoExplore',
                      style: TextStyle(
                        color: Color(0xFF238F8F),
                        fontSize: 17.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'IQT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Aquí puedes agregar más elementos según sea necesario
            Expanded(
              child: Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Text("ID: ${usuarios[0].idEmpresa}S"),
                        Text(
                          "Mi local ${widget.idEA}${widget.emailEA}",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardRegister(
                              empresaCR: widget.empresaH,
                              idECR: widget.idEA,
                              emailCR: widget.emailEA,
                              // ####
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity, // Ancho completo
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(children: [
                              Container(
                                width: 60, // Ancho del icono
                                height: 60, // Alto del icono
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF238F8F),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      20), // Espacio entre el icono y el texto
                              Expanded(
                                child: Text(
                                  "Agregar local",
                                  style: TextStyle(
                                      color: Color(0xFF238F8F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    /*  Flexible(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 10),
                        itemCount: HomeAdminScreen.placeE.length,
                        itemBuilder: (context, index) {
                          return YourWidgetEditP(
                            place: HomeAdminScreen.placeE[index],
                            userC: widget.empresaH!, //####
                          );
                        },
                      ),
                    ), */

                    Flexible(
                      child: ListView.builder(
                        itemCount: usuarios.length,
                        itemBuilder: (context, index) {
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
                                        '${usuarios[index].imageLocal}',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    //id
                                    Visibility(
                                        visible: false,
                                        child:
                                            Text("${usuarios[index].idLocal}")),
                                    SizedBox(
                                        width:
                                            10.0), // Espacio entre la imagen y el texto
                                    // 3.2. Contenido del lugar
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // 3.3. Nombre del lugar y ranking
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${usuarios[index].nombreLocal}  id: ${usuarios[index].idLocal}',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                //Realizamos una condicional para hacer el cambio de estado
                                                '${usuarios[index].estadoLocal}',
                                                style: TextStyle(
                                                  color: usuarios[index]
                                                              .estadoLocal ==
                                                          "Abierto"
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // Aquí puedes agregar la lógica para editar
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewCardAdmin(
                                                        idEmpresaVC:
                                                            widget.idEA,
                                                        idlocalVC:
                                                            usuarios[index]
                                                                .idLocal,
                                                        emailVC: widget.emailEA,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.orangeAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
