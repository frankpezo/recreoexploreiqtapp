import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/pages/categorias/belen_cate.dart';
import 'package:recreoexploreiqtapp/src/pages/categorias/iquitos_cate.dart';
import 'package:recreoexploreiqtapp/src/pages/categorias/punchana_cate.dart';
import 'package:recreoexploreiqtapp/src/pages/categorias/sanjuan_cate.dart';
import 'package:recreoexploreiqtapp/src/pages/categorias/top_cate.dart';

class HomeUserScreen extends StatefulWidget {
  final ModelUser userH;
  HomeUserScreen({Key? key, required this.userH}) : super(key: key);

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  final categoryList = [
    "Top",
    "Iquitos",
    "San Juan Bautista",
    "Punchana",
    "Belén"
  ];
  //Lista para buscar elementos de la categoría
  List<PlaceModel> lugares = [];
  void initState() {
    super.initState();
    // Popular
    lugares.addAll(TopCate.placesTop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: categoryList.length,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Alineación vertical al centro
                    children: [
                      Image.asset(
                        "assets/images/icon2.1.png",
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
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
                  SizedBox(
                    height: 30.0,
                  ),
                  // 2. Buscador
                  buildSearchTextField(),
                  SizedBox(
                    height: 30.0,
                  ),

                  // 3. Categorías
                  Container(
                    height: 35,
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Color(0xFF238F8F),
                        borderRadius: BorderRadius.circular(
                            24.0), // Puedes cambiar el color del círculo resaltado
                      ),
                      isScrollable: true,
                      tabs: categoryList.map((category) {
                        return Tab(
                          text: category,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: categoryList.map((category) {
                  return _buildCategoryContent(category);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

//3.1. Función que contiene el widget de página de cada categoría
  Widget _buildCategoryContent(String category) {
    // Aquí puedes personalizar el contenido según la categoría seleccionada
    return TabBarView(
      children: [
        //3.1.1. Colocamos las páginas
        TopCate(
          userT: widget.userH,
        ),
        IquitosCate(),
        SanjuanCate(
          userS: widget.userH,
        ),
        PunchanaCate(),
        BelenCate()
      ],
    );
  }

  //3.2. Buscador
  Widget buildSearchTextField() {
    return Container(
      width: double.infinity,
      child: TextField(
        onChanged: buscarElementoCate,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 234, 233, 233),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'Buscar recreo turístico... ',
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: Icon(Icons.search),
          suffixIconColor: Color.fromARGB(255, 19, 19, 19),
          contentPadding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 20.0,
          ), // Ajusta según sea necesario
        ),
      ),
    );
  }

  //3.3. Buscar contenido de la categoría
  void buscarElementoCate(String value) {
    setState(() {
      lugares = lugares
          .where((place) =>
              place.nombrePlace.toLowerCase().contains(value.toLowerCase()) ||
              place.direPlace.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
