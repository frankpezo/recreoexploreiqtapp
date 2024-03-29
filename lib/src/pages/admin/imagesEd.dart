/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/instaEd.dart';

class ImaEd extends StatefulWidget {
  final PlaceModel placeViewI;
  final EmpresaModel userIED;
  final List<String> selectedInstallations;
  ImaEd(
      {Key? key,
      required this.placeViewI,
      required this.selectedInstallations,
      required this.userIED})
      : super(key: key);

  @override
  State<ImaEd> createState() => _ImaEdState();
}

class _ImaEdState extends State<ImaEd> {
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    selectedCategories = List.from(widget.selectedInstallations);
  }

  List<String> getCategoryImages(String categoryName) {
    String? serializedImages = widget.placeViewI.catePlace[categoryName];
    if (serializedImages == null || serializedImages.isEmpty) {
      return [];
    }
    List<dynamic> decodedList = json.decode(serializedImages);
    List<String> imagesList = List<String>.from(decodedList);
    return imagesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SafeArea(
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
                              builder: (context) => InstaEd(
                                placeViewEd: widget.placeViewI,
                                userInstEd: widget.userIED,
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
                                empresaB: widget.userIED,
                              ),
                            ),
                          ); */
                        },
                        child: Text(
                          'Omitir',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
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
                                        .map((category) => Tab(text: category))
                                        .toList(),
                                  ),
                                  SizedBox(height: 17),
                                  SizedBox(
                                    height: 200,
                                    child: TabBarView(
                                      children:
                                          selectedCategories.map((category) {
                                        return GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 4.0,
                                            mainAxisSpacing: 4.0,
                                          ),
                                          itemCount: getCategoryImages(category)
                                              .length,
                                          itemBuilder: (context, index) {
                                            String imageUrl = getCategoryImages(
                                                category)[index];
                                            return Container(
                                              alignment: Alignment.center,
                                              color: Colors.grey[300],
                                              child: Stack(
                                                children: [
                                                  if (index == 4) ...[
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        // Agregar lógica para seleccionar imagen
                                                      },
                                                    ),
                                                  ],
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: IconButton(
                                                      icon: Icon(Icons.close),
                                                      onPressed: () {
                                                        // Agregar lógica para eliminar imagen
                                                      },
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    'assets/images/$imageUrl',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
    );
  }
}
 */