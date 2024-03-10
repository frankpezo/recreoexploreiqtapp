import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/viewAdminCard.dart';
// Importa el archivo con las funciones de la base de datos

class InstaEd extends StatefulWidget {
  final int? idEmpresaIED;
  final int? idLocalCIED;
  InstaEd({
    Key? key,
    this.idEmpresaIED,
    this.idLocalCIED,
  }) : super(key: key);

  @override
  State<InstaEd> createState() => _InstaEdState();
}

class _InstaEdState extends State<InstaEd> {
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

  @override
  void initState() {
    super.initState();
    _loadInstalledCategories();
  }

  List<String> getSelectedInstallations() {
    List<String> selectedInstallations = [];
    categories.forEach((key, value) {
      if (value) {
        selectedInstallations.add(key);
      }
    });
    return selectedInstallations;
  }

  Future<void> _loadInstalledCategories() async {
    // Obtener las instalaciones registradas para el local actual
    List<String> installedCategories = await Databasehelper.instance
        .obtenerInstalacionesPorIdLocal(widget.idLocalCIED);

    // Marcar las instalaciones registradas
    installedCategories.forEach((category) {
      if (categories.containsKey(category)) {
        setState(() {
          categories[category] = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 8,
                          right:
                              20, // Ajusta el padding aquí para alinear la flecha con el borde derecho
                          left:
                              20, // Añade un padding izquierdo para alinear la flecha con el borde izquierdo
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewCardAdmin(
                                  idEmpresaVC: widget.idEmpresaIED,
                                  idlocalVC: widget.idLocalCIED,
                                ),
                              ),
                            );
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
                      ),
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
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF238F8F))),
                                  /*  Text(
                                      "idEmpresa: ${widget.idEmpresaIED} -- idLocal: ${widget.idLocalCIED}") */
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
                                  int? idLocal = widget.idLocalCIED;
                                  if (idLocal != null) {
                                    await Databasehelper.instance
                                        .actualizarInstalaciones(
                                            idLocal, selectedInstallations);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(255, 36, 246, 116),
                                      content: Text(
                                        'Se actualizó las instalaciones',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      duration: Duration(seconds: 3),
                                    ));
                                  } else {
                                    print(
                                        "Error al actualizar las instalaciones");
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
    );
  }
}
