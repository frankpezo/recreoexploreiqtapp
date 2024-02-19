import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/edProfileAd.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/login_admin.dart';

class ProfileAdminScreen extends StatefulWidget {
  final EmpresaModel userP;
  ProfileAdminScreen({Key? key, required this.userP}) : super(key: key);

  @override
  State<ProfileAdminScreen> createState() => _ProfileAdminScreenState();
}

class _ProfileAdminScreenState extends State<ProfileAdminScreen> {
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
                        Text(
                          "Mi Perfil",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
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
                                    backgroundImage: AssetImage(
                                        'assets/images/${widget.userP.img}'), // Ruta de la imagen del usuario
                                    radius: 35,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // Nombre de usuario y Email
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.userP.nombreEmpresa} ', //Datos dinámicos
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${widget.userP.emailEmpresa}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Botones
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EdProfileAdmin(
                                                        userAdEd:
                                                            widget.userP)));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
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
                                                builder: (context) =>
                                                    LoginAdmin()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
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
                                        primary: Colors
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
                                          Text('Eliminar cuenta'),
                                          SizedBox(width: 10),
                                          Icon(Icons.delete),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
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
