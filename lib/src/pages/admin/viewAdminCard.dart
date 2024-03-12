import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottom_UserNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cadEdRegister.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/instaEd.dart';

class ViewCardAdmin extends StatefulWidget {
  final EmpresaModel? empresaVC;
  final int? idEmpresaVC;
  final int? idlocalVC;
  final String? emailVC;
  ViewCardAdmin({
    Key? key,
    this.idEmpresaVC,
    this.idlocalVC,
    this.emailVC,
    this.empresaVC,
  }) : super(key: key);

  @override
  State<ViewCardAdmin> createState() => _ViewCardAdminState();
}

class _ViewCardAdminState extends State<ViewCardAdmin> {
  //Traemos el id del local
  LocalModel? _local;
  List<Map<String, dynamic>> _instalaciones =
      []; // Lista de instalaciones del local
  bool _isLoading = true; // Variable para controlar el estado de carga

  @override
  void initState() {
    super.initState();
    _loadLocalData(); //Para obtener infor del local
    _loadInstalacionesData();
  }

  //1. Obtener info por medi de idLocal
  Future<void> _loadLocalData() async {
    Databasehelper dbHelper = Databasehelper.instance;
    List<Map<String, dynamic>> localData =
        await dbHelper.traerLocalPorId(widget.idlocalVC);
    if (localData.isNotEmpty) {
      setState(() {
        _local = LocalModel.fromMap(localData.first);
      });
    }
  }

  //2. obtener info de instlaciones del local
  Future<void> _loadInstalacionesData() async {
    Databasehelper dbHelper = Databasehelper.instance;
    List<String> nombresInstalaciones =
        await dbHelper.obtenerInstalacionesPorIdLocal(widget.idlocalVC);
    setState(() {
      _instalaciones = nombresInstalaciones
          .map((nombre) => {
                'categoria':
                    nombre, // Cambiar 'nombreInstalacion' a 'categoria'
              })
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading // Verificamos si los datos están cargando
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /* Row(
                    children: [
                      Text(
                          "idEmpresa: ${widget.idEmpresaVC} - emailE: ${widget.emailVC} | idLocal: ${widget.idlocalVC}")
                    ],
                  ), */
                  Stack(
                    children: [
                      Image.asset(
                        _local?.imageLocal ?? '',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 16.0,
                        left: 16.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BottomNavAdmin(
                                      empresaB: widget.empresaVC,
                                      idEmpre: widget.idEmpresaVC,
                                      emailEmpresa: widget.emailVC
                                      // empresaB: widget.userViewA,
                                      );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(15),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _local?.nombreLocal ?? '',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Editar",
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Aquí puedes agregar la lógica para editar
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CardEdRegister(
                                            idEmpresaCER: widget.idEmpresaVC,
                                            idlocalCER: widget.idlocalVC,
                                            emailCER: widget.emailVC,
                                          ),
                                        ),
                                      );
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
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.red, size: 16.0),
                                  Text(
                                    _local?.direccionLocal ?? '',
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ],
                              ),
                              SizedBox(width: 90.0),
                              Row(
                                children: [
                                  Text(
                                    //Realizamos una condicional para hacer el cambio de estado
                                    _local?.estadoLocal ?? '',
                                    style: TextStyle(
                                      color: _local?.estadoLocal == "Abierto"
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //Distrito
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Text(_local?.distritoLocal ?? '')],
                          ),
                          //Precios
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Precio',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF238F8F)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: Color(0xFF238F8F), size: 16.0),
                                      SizedBox(width: 5.0),
                                      Text(
                                        _local?.horarioLocal ?? '',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Niño - S/. ${_local?.ninoPrice ?? ''}",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "Adulto - S/.${_local?.adultoPrice ?? ''}",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "Turistas - S/. ${_local?.turistaPrice ?? ''}",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "Feriados - S/. ${_local?.feriadoPrice ?? ''}",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone_android,
                                      color: Color(0xFF238F8F), size: 16.0),
                                  SizedBox(width: 5.0),
                                  Text(
                                    _local?.telefonoLocal ?? '',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Descripción
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Descripción',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF238F8F)),
                              ),
                              Text(_local?.descripcionLocal ?? '',
                                  textAlign: TextAlign.justify),

                              SizedBox(
                                height: 10,
                              ),
                              //Palabras claves
                              Row(
                                children: [
                                  Text(
                                    "Palabras claves: ",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    _local!.palabrasClaves?.join(', ') ?? '',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 171, 173, 173)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //2. Card 2
                  Card(
                    margin: EdgeInsets.all(16.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: DefaultTabController(
                        length: _instalaciones.length,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              child: TabBar(
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                indicator: BoxDecoration(
                                  color: Color(0xFF238F8F),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                isScrollable: true,
                                tabs: _instalaciones.map((instalacion) {
                                  return Tab(
                                    text: instalacion['categoria'] ??
                                        'Sin categoría',
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              child: TabBarView(
                                children: _instalaciones.map((instalacion) {
                                  return _buildCategoryContent(instalacion);
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Editar",
                                  style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InstaEd(
                                          idEmpresaIED: widget.idEmpresaVC,
                                          idLocalCIED: widget.idlocalVC,
                                        ),
                                      ),
                                    );
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  //1.1. Función de la categoría
  Widget _buildCategoryContent(instalacion) {
    switch (instalacion['categoria']) {
      case "Cancha deportiva":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      case "Lugar":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      case "Parqueo":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      case "Piscina":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      case "Playa":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      case "Restaurante":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      case "Zoológico":
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instalacion['imagenes'] != null)
                for (final image in jsonDecode(instalacion['imagenes']))
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/$image'),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
