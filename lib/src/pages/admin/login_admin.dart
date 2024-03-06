import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/componentes/controller.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/register_admin.dart';
import 'package:http/http.dart' as http;
import 'package:recreoexploreiqtapp/src/pages/welcome_splash.dart'; //Para consumir la Api

class LoginAdmin extends StatefulWidget {
  final EmpresaModel? empresaL;
  LoginAdmin({Key? key, this.empresaL}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final GlobalKey<FormState> formKeyTres = GlobalKey<FormState>();
  //1. Controller para los campos
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  List<dynamic> userData = [];
  //1.1. Lista de usuario
  final List<EmpresaModel> userE = [
    EmpresaModel(
        idEmpresa: 1,
        nombreEmpresa: "Cuistococha",
        emailEmpresa: "quistococha@gmail.com",
        passwordEmpresa: '12345',
        imgEmpresa: 'quisLogo.jpg'),
  ];

/*   @override
  void initState() {
    super.initState();
    if (widget.empresaL != null) {
      email.text = widget.empresaL!.emailEmpresa!;
      password.text = widget.empresaL!.passwordEmpresa!;
    }
  }
 */
  //2. Para el Api
  Future<void> getDatos() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        //1. Lógica
        final emailC = email.text.trim();
        final passC = password.text.trim();

        final success =
            await Databasehelper.instance.loginEmpresa(emailC, passC);

        if (success) {
          print('Se inicio sesión con éxito');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavAdmin(
                        empresaB: widget.empresaL,
                      )));
        } else {
          print('Los datos no coinciden');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color.fromARGB(255, 242, 48, 48),
              content: Text(
                'Los datos no coinciden',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
        //Lógico para los datos estáticos del MODEL
        /* final emailC = email.text.trim();
        final passC = password.text.trim();
        //Verificamos si coinciden
        final user = userE.firstWhere(
          (user) =>
              user.emailEmpresa == emailC && user.passwordEmpresa == passC,
          orElse: null,
        );

        if (user != '') {
          print("Se inició sesión con éxito");

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavAdmin(
                        user: user,
                      )));
        }

        } */
      } catch (e) {
        String e = "fallo";
        print(e);
      }
      // Lógica para consumir la API
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 242, 48, 48),
        content: Text(
          'Los campos no pueden quedar vacíos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKeyTres,
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Container(
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
                                        builder: (context) => WelcomeSplah(),
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
                          Card(
                            color: Colors.white,
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
                                    SizedBox(height: 20),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 3, left: 40),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/icon2.1.png",
                                            width: 60,
                                            height: 60,
                                          ),
                                          Expanded(
                                            child:
                                                Container(), // Este contenedor ocupa el espacio restante
                                          ),
                                          Image.asset(
                                            "assets/images/icon6.png",
                                            width: 95,
                                            height: 95,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 1,
                                        right: 155,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Iniciar Sesión',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              color: Color(0xFF238F8F),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      width: 325,
                                      height: 70,
                                      padding: const EdgeInsets.only(
                                          top: 3, left: 15),
                                      child: TextFormField(
                                        controller: email,
                                        obscureText: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Por favor, ingrese su correo electrónico';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Email empresa',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 17),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      width: 325,
                                      height: 70,
                                      padding: const EdgeInsets.only(
                                          top: 3, left: 15),
                                      child: TextFormField(
                                        controller: password,
                                        obscureText: obscurePassword,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Por favor, ingrese su contraseña';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Contraseña',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500]),
                                          suffixIcon: IconButton(
                                            onPressed: () => setState(() {
                                              obscurePassword =
                                                  !obscurePassword;
                                            }),
                                            icon: Icon(obscurePassword
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            padding: EdgeInsets.only(bottom: 7),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '¿Aún no tienes cuenta? ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        InkWell(
                                          child: GestureDetector(
                                            child: Text(
                                              'Registrarse',
                                              style: TextStyle(
                                                color: Color(0xFF238F8F),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onTap: () =>
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RegisterAdmin())),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (formKeyTres.currentState!
                                              .validate()) {
                                            getDatos();
                                          }
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 10, top: 20),
                                        width: 325, // Ancho original del botón
                                        height: 45,
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF238F8F),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Ingresar',
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
                        ],
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
