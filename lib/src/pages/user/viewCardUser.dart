import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';

import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottom_UserNav.dart';

import '../categorias/subcat/subCat1.dart';

class ViewCardUser extends StatefulWidget {
  final ModelUser? userVC;
  final int? idUserVC;
  final String? emailUserVc;
  final int? idLocalVC;
  ViewCardUser(
      {Key? key, this.userVC, this.idUserVC, this.emailUserVc, this.idLocalVC})
      : super(key: key);

  @override
  State<ViewCardUser> createState() => _ViewCardUserState();
}

class _ViewCardUserState extends State<ViewCardUser> {
  //1.1. Declaramos las instalaciones del luegar
  /* List<InstaModel> placesInsta = [
    InstaModel(
      instPlace: ["Zoológico", "Playa"],
    ),
  ]; */

  /* final categoryList = [
    "Cancha deportiva",
    "Parqueo",
    "Piscina",
    "Playa",
    "Restaurante",
    "Zona de juegos",
    "Zoológico"
  ]; */
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController comentarioU = TextEditingController();
  double fontSize = 11.0; // Definir la variable fontSize aquí
  int selectedValue = 1;
  //2. Traemos info para mostra local e instalaciones
  LocalModel? _local;
  List<Map<String, dynamic>> _instalaciones =
      []; // Lista de instalaciones del local
  List<Map<String, dynamic>> _comentarios = []; // Lista de comentarios
  bool _isLoading = true; // Variable para controlar el estado de carga

  @override
  void initState() {
    super.initState();
    _loadLocalData(); //Para obtener infor del local
    _loadInstalacionesData();
  }

//2.1. FUnción para obtener info de local
  Future<void> _loadLocalData() async {
    Databasehelper dbHelper = Databasehelper.instance;
    List<Map<String, dynamic>> localData =
        await dbHelper.traerLocalPorId(widget.idLocalVC);
    if (localData.isNotEmpty) {
      setState(() {
        _local = LocalModel.fromMap(localData.first);
      });
    }
  }

  //2.2. obtener info de instlaciones del local
  Future<void> _loadInstalacionesData() async {
    Databasehelper dbHelper = Databasehelper.instance;
    List<String> nombresInstalaciones =
        await dbHelper.obtenerInstalacionesPorIdLocal(widget.idLocalVC);
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

  //Para registrar
  Future<void> inserComentario() async {
    if (_local != null) {
      int? idLocal = widget.idLocalVC;
      // Suponiendo que tienes una forma de obtener el ID del usuario actual
      int? idUsuario = widget.idUserVC /* Obtener el ID del usuario actual */;
      int puntuacion = selectedValue;
      String comentario = comentarioU.text;

      /*    print(idLocal);
      print(idUsuario);
      print(puntuacion);
      print(comentario); */
      // Llama al método insertPuntuacionLocal para insertar la puntuación y el comentario
      int result = await Databasehelper.instance
          .insertPuntuacionLocal(idLocal, idUsuario, puntuacion, comentario);
      if (result != null && result > 0) {
        // La puntuación y el comentario se insertaron correctamente
        // Aquí puedes realizar cualquier acción adicional, como mostrar un mensaje de éxito
        print("Puntuación y comentario insertados correctamente");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 36, 246, 116),
          content: Text(
            'Se subió con éxito',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 5),
        ));
      } else {
        // Ocurrió un error al insertar la puntuación y el comentario
        // Puedes mostrar un mensaje de error o manejar la situación de otra manera
        print("Error al insertar la puntuación y el comentario");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Ocurrió un error al subir',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          duration: Duration(seconds: 5),
        ));
      }
    } else {
      // Si el objeto _local es nulo, significa que no se cargó correctamente la información del local
      // Puedes manejar esta situación de acuerdo a tus necesidades
      print("No se pudo obtener la información del local");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                    "IDUSER:${widget.idUserVC} EmaiUser: ${widget.emailUserVc} | IDLOCAL: ${widget.idLocalVC} ")
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  _local?.imageLocal ?? '',
                  width: MediaQuery.of(context).size.width,
                  //height: 100.0,
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
                            return BottomNavUser(
                                userBN: widget.userVC,
                                idUserBN: widget.idUserVC,
                                emailUserBN: widget.emailUserVc);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            //1. Card description
            Card(
              margin: EdgeInsets.all(15),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1. Row
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
                            Icon(Icons.star, color: Colors.amber),
                            //Text('${widget.placeView.rakingPlace}'),
                            Text('3'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    //1. Lugar horario
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
                              "Adulto - S/. ${_local?.adultoPrice ?? ''}",
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
                                  color: Color.fromARGB(255, 171, 173, 173)),
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
                              text: instalacion['categoria'] ?? 'Sin categoría',
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
                    ],
                  ),
                ),
              ),
            ),

            //Card comentario y puntuación
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Card Comentarios
                Container(
                  width: 180,
                  child: Card(
                    margin: EdgeInsets.all(9.0),
                    child: SizedBox(
                      height:
                          150, // Ajusta la altura del Card según sea necesario
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 3, // Número de usuarios que deseas mostrar
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.jpg'),
                                      radius: 30,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 17,
                                        ),
                                        Text(
                                          '3.0', // Aquí deberías reemplazar con la puntuación del usuario
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Nombre Usuario $index', // Aquí deberías reemplazar con el nombre del usuario
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Comentario $index', // Aquí deberías reemplazar con el comentario del usuario
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                //Card puntuación
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    margin: EdgeInsets.all(5.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              'Puntuar',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF238F8F)),
                            ),
                            SizedBox(
                                width:
                                    10), // Espacio entre el texto y la lista desplegable
                            DropdownButton<int>(
                              value:
                                  selectedValue, // Utiliza una variable de estado para almacenar el valor seleccionado
                              items: [
                                DropdownMenuItem<int>(
                                  value: 1,
                                  child: Text('1'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 2,
                                  child: Text('2'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 3,
                                  child: Text('3'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 4,
                                  child: Text('4'),
                                ),
                                DropdownMenuItem<int>(
                                  value: 5,
                                  child: Text('5'),
                                ),
                              ],
                              onChanged: (int? value) {
                                // Actualiza el estado con el nuevo valor seleccionado
                                setState(() {
                                  selectedValue = value!;
                                  print(selectedValue);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        //Comentario
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 100,
                          height: 50,
                          padding: const EdgeInsets.only(top: 3, left: 15),
                          child: TextFormField(
                            controller: comentarioU,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            onChanged: (text) {
                              // Verifica si el texto ingresado tiene al menos un carácter
                              if (text.isNotEmpty) {
                                // Cambia el tamaño de la letra
                                setState(() {
                                  // Puedes ajustar el tamaño de la letra según lo necesites
                                  // Por ejemplo, aquí se establece un tamaño de fuente más pequeño
                                  fontSize = 9.0;
                                });
                              } else {
                                setState(() {
                                  // Si el campo está vacío, restaura el tamaño de la letra original
                                  fontSize = 9.0;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Comentar...',
                              // Utiliza la variable fontSize para establecer el tamaño de la letra
                              hintStyle: TextStyle(
                                  color: Colors.grey[500], fontSize: fontSize),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              inserComentario();
                            });
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 10, top: 20),
                            width: 100, // Ancho original del botón
                            height: 30,
                            padding: const EdgeInsets.only(top: 3, left: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF238F8F),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Subir',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
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
