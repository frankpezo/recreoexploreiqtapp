import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardInsta.dart';

class CardImages extends StatefulWidget {
  //final EmpresaModel userIma;

  final List<String> selectedInstallations;
  final EmpresaModel? empresaCIM;
  final int? idempresaCIM;
  final int? idlocalCIM;
  final String? emailCIM;
  CardImages(
      {Key? key,
      required this.selectedInstallations,
      this.idempresaCIM,
      this.idlocalCIM,
      this.empresaCIM,
      this.emailCIM})
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
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                              builder: (context) => BottomNavAdmin(
                                empresaB: widget.empresaCIM,
                                idEmpre: widget.idempresaCIM,
                                emailEmpresa: widget.emailCIM,
                              ),
                            ),
                          );
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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF238F8F),
                                  ),
                                ),
                                /* Text(
                                    "idEmpresa: ${widget.idempresaCIM} -- idLocal: ${widget.idlocalCIM}") */
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
                                  SizedBox(
                                    height: 200, // Altura del TabView
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
                                          itemCount: 9,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              alignment: Alignment.center,
                                              color: Colors.grey[300],
                                              child: Stack(
                                                children: [
                                                  // Botón de agregar imagen
                                                  if (index == 4) ...[
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        // Agregar lógica para seleccionar imagen
                                                      },
                                                    ),
                                                  ],
                                                  // Botón de eliminar imagen
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
                                                  // Aquí se mostraría la imagen seleccionada
                                                  // Puedes reemplazar este Container con tu widget de imagen
                                                  Container(
                                                    child: Icon(Icons.image),
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
