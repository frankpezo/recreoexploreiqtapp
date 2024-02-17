import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardInsta.dart';

class CardImages extends StatefulWidget {
  final EmpresaModel userIma;
  final List<String> selectedInstallations;
  CardImages(
      {Key? key, required this.userIma, required this.selectedInstallations})
      : super(key: key);

  @override
  State<CardImages> createState() => _CardImagesState();
}

class _CardImagesState extends State<CardImages> {
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    // Actualizar selectedCategories con las instalaciones seleccionadas
    selectedCategories = List.from(widget.selectedInstallations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            //key: formKeySix, // Asignar la nueva GlobalKey al Form
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 8,
                            right: 20,
                            left: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardInsta(
                                    userI: widget.userIma,
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 8,
                                right: 20,
                                left: 20,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavAdmin(
                                    user: widget.userCard,
                                  ),
                                ),
                              ); */
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Omitir',
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
                                    Text(
                                      "Instalaciones",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF238F8F),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                DefaultTabController(
                                  length: selectedCategories.length,
                                  child: Column(
                                    children: [
                                      TabBar(
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.black,
                                        indicator: BoxDecoration(
                                          color: Color(0xFF238F8F),
                                          borderRadius: BorderRadius.circular(
                                              24.0), // Puedes cambiar el color del círculo resaltado
                                        ),
                                        isScrollable: true,
                                        tabs: selectedCategories
                                            .map((category) =>
                                                Tab(text: category))
                                            .toList(),
                                      ),
                                      SizedBox(
                                        height: 200, // Altura del TabView
                                        child: TabBarView(
                                          children: selectedCategories
                                              .map((category) {
                                            return Center(
                                              child: Text(
                                                'Contenido para $category',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Aquí puedes usar las variables para saber qué opciones han sido seleccionadas
                                    // Luego puedes guardar estos valores como desees.
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                      top: 20,
                                    ),
                                    width: 325, // Ancho original del botón
                                    height: 45,
                                    padding: const EdgeInsets.only(
                                      top: 3,
                                      left: 10,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF238F8F),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Agregar imágenes',
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
