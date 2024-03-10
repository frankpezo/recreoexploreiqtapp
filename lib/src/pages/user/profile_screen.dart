import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/pages/user/edit_perfil.dart';
import 'package:recreoexploreiqtapp/src/pages/user/login_user.dart';

class ProfileUserScreen extends StatefulWidget {
  final int? idUserP;
  final String? emailUserP;
  ProfileUserScreen({
    Key? key,
    this.idUserP,
    this.emailUserP,
  }) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  //1. Creamos model del user aquí
  ModelUser? _user;
  //1.1. Aquí inicialermos la función creada abajo
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //1.1.1 Aquí irá la función
    _loadUserData();
  }

  //2. Función que permitirá traer los datos
  Future<void> _loadUserData() async {
    //2.1. Sqlite
    Databasehelper dbHelper = Databasehelper.instance;
    //2.2. Mapeo
    List<Map<String, dynamic>> userData =
        await dbHelper.traerUserPorId(widget.idUserP);
    if (userData.isNotEmpty) {
      setState(() {
        _user = ModelUser.fromMap(userData.first);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Row(
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
            SizedBox(height: 50),
            // Texto "Perfil"
            Row(
              children: [
                Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'IDUSER: ${widget.idUserP} - EmailUse: ${widget.emailUserP}',
                )
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajustar el radio del borde del Card
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        // Imagen redonda y Nombre de usuario y Email
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(_user?.imgUser ??
                                  ''), // Ruta de la imagen del usuario
                              radius: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Nombre de usuario y Email
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_user?.nombreUser ?? ''} ${_user?.apellidoUser ?? ''}", //Datos dinámicos
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${_user?.emailUser ?? ''}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Botones
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  /*  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditPefil(
                                              userEdt: widget.userP))); */
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .white, // Cambiar el color de fondo del botón
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Agregar un radio
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          86), // Ajustar el ancho del botón
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Icono a la izquierda del texto
                                    // Espacio entre el icono y el texto
                                    Text('Editar perfil',
                                        style: TextStyle(
                                            color: Color(0xFF238F8F))),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      color: Color(0xFF238F8F),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginUser()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .white, // Cambiar el color de fondo del botón
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Agregar un radio
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          84), // Ajustar el ancho del botón
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Icono a la izquierda del texto
                                    // Espacio entre el icono y el texto
                                    Text('Cerrar sesión',
                                        style: TextStyle(
                                            color: Color(0xFF238F8F))),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.exit_to_app,
                                      color: Color(0xFF238F8F),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              ElevatedButton(
                                onPressed: () {
                                  // Acción para eliminar cuenta
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .red, // Cambiar el color de fondo del botón
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Agregar un radio
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          75), // Ajustar el ancho del botón
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Icono a la izquierda del texto
                                    // Espacio entre el icono y el texto
                                    Text(
                                      'Eliminar cuenta',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.delete, color: Colors.white),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
