import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardImages.dart'; // Asegúrate de importar el archivo de ayuda de la base de datos

class CardInsta extends StatefulWidget {
  final int? idEmpresaCI;
  final int? idLocalCI;
  final String? emailCI;
  CardInsta({
    Key? key,
    this.idEmpresaCI,
    this.idLocalCI,
    this.emailCI,
  }) : super(key: key);

  @override
  State<CardInsta> createState() => _CardInstaState();
}

class _CardInstaState extends State<CardInsta> {
  Map<String, bool> categories = {
    'Cancha deportiva': false,
    'Lugar': false,
    'Parqueo': false,
    'Piscina': false,
    'Playa': false,
    'Restaurante': false,
    'Zona de juegos': false,
    'Zoológico': false,
  };
//Para ver las instalaciones seleccionadas
  List<String> getSelectedInstallations() {
    List<String> selectedInstallations = [];
    categories.forEach((key, value) {
      if (value) {
        selectedInstallations.add(key);
      }
    });
    return selectedInstallations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Container(
                          padding: const EdgeInsets.only(
                            top: 8,
                            right: 20,
                            left: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 24,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Regresar',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), */
                      ],
                    ),
                    Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: EdgeInsets.all(15),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 40,
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Instalaciones",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF238F8F))),
                                    /*      Text(
                                        "idEmpresa: ${widget.idEmpresaCI} -- idLocal: ${widget.idLocalCI}") */
                                  ],
                                ),
                                SizedBox(height: 15),
                                Column(
                                  children: categories.keys.map((String key) {
                                    return CheckboxListTile(
                                      title: Text(key),
                                      value: categories[key] ?? false,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          categories[key] = value!;
                                          print('$key: ${categories[key]}');
                                        });
                                      },
                                      activeColor: Color(0xFF238F8F),
                                      checkColor: Colors.white,
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () async {
                                    List<String> selectedInstallations =
                                        getSelectedInstallations();
                                    int? idLocal = widget.idLocalCI;
                                    if (idLocal != null) {
                                      //Regisrar instalaciones
                                      await Databasehelper.instance
                                          .insertInstalaciones(
                                              idLocal, selectedInstallations);
                                      //Mostrar instalaciones por terminal
                                      /*  await Databasehelper.instance
                                          .mostrarInstalaciones(idLocal); */
                                      //Mensaje y cambio de página
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CardImages(
                                                    selectedInstallations:
                                                        selectedInstallations,
                                                    idempresaCIM:
                                                        widget.idEmpresaCI,
                                                    idlocalCIM:
                                                        widget.idLocalCI,
                                                    emailCIM: widget.emailCI,
                                                  )));

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(255, 36, 246, 116),
                                        content: Text(
                                          'Se guardaron las instalaciones',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        duration: Duration(seconds: 3),
                                      ));
                                      //Redireccionar
                                    } else {
                                      print("error al guardar instalaciones");
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 10, top: 20),
                                    width: 325,
                                    height: 45,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF238F8F),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Guardar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
