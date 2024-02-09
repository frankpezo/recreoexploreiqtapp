import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/pages/user/login_user.dart';

class ProfileUserScreen extends StatefulWidget {
  final ModelUser currentUser;
  ProfileUserScreen({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
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
            Text(
              'Perfil',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            // Imagen redonda y Nombre de usuario y Email
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/${widget.currentUser.imgUser}'), // Ruta de la imagen del usuario
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
                      '${widget.currentUser.nombreUser} ${widget.currentUser.apellidoUser}', //Datos dinámicos
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '${widget.currentUser.emailUser}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            // Botones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para eliminar cuenta
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.white, // Cambiar el color de fondo del botón
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Agregar un radio
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 86), // Ajustar el ancho del botón
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icono a la izquierda del texto
                        // Espacio entre el icono y el texto
                        Text('Editar perfil',
                            style: TextStyle(color: Color(0xFF238F8F))),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginUser()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.white, // Cambiar el color de fondo del botón
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Agregar un radio
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 84), // Ajustar el ancho del botón
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icono a la izquierda del texto
                        // Espacio entre el icono y el texto
                        Text('Cerrar sesión',
                            style: TextStyle(color: Color(0xFF238F8F))),
                        SizedBox(width: 10),
                        Icon(
                          Icons.exit_to_app,
                          color: Color(0xFF238F8F),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para eliminar cuenta
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.red, // Cambiar el color de fondo del botón
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Agregar un radio
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 75), // Ajustar el ancho del botón
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
