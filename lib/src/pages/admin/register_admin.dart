import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/login_admin.dart';
//EL http, importante para que funcione la api
import 'package:http/http.dart' as http;
import 'package:recreoexploreiqtapp/src/pages/welcome_splash.dart';

class RegisterAdmin extends StatefulWidget {
  final EmpresaModel? empresaM;
  RegisterAdmin({Key? key, this.empresaM}) : super(key: key);

  @override
  State<RegisterAdmin> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  //1. Text Controllers
  final GlobalKey<FormState> formKeyFour = GlobalKey<FormState>();
  TextEditingController nombre = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  List<dynamic> userData = []; //Nos servirá para el registro

  @override
  void initState() {
    super.initState();
    if (widget.empresaM != null) {
      nombre.text = widget.empresaM!.nombreEmpresa!;
      email.text = widget.empresaM!.emailEmpresa!;
      password.text = widget.empresaM!.passwordEmpresa!;
    }
  }

  //2. Api para insertar en la bd
  Future<void> insertUser() async {
    if (nombre.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      //print("Registro con éxito");
      // Lógica para consumir la API
      try {
        //Verificar si ya existe la empresa registrada
        // 2.1. Lógica de verificación de existencia del local
        bool empresaExistente = await Databasehelper.instance
            .existeEmpresa('${nombre.text}', '${email.text}');

        //Hacemos la verificación
        if (empresaExistente) {
          // Mostrar mensaje de error porque el local ya existe
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 242, 48, 48),
            content: Text(
              'La empresa ya está registrada',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(seconds: 3),
          ));
        } else {
          //2.1. Instanciamos
          EmpresaModel empresa = EmpresaModel(
              // idEmpresa: widget.empresaM?.idEmpresa,
              nombreEmpresa: nombre.text,
              emailEmpresa: email.text,
              passwordEmpresa: password.text,
              imgEmpresa: "assets/images/10.jpg");
          //2.2. Hacemos condicional para ver si se registra
          if (widget.empresaM == null) {
            await Databasehelper.instance.insertEmpresa(empresa);
            print("Se registró empresa con éxitoo");
            //Para que nos mande al Login
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginAdmin()));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Color.fromARGB(255, 36, 246, 116),
              content: Text(
                'Se registró con éxito',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              duration: Duration(seconds: 5),
            ));
            print("Lista de empresas registradas");
            await Databasehelper.instance.mostrarEmpresas();
          } else {
            print("Error al registrar");
          }
        }
      } catch (e) {
        print("El error es: ${e}");
      }
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
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/icon1.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKeyFour,
            child: SafeArea(
              child: Container(
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
                                SizedBox(height: 20),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        "assets/images/icon7.1.png",
                                        width: 90,
                                        height: 90,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 1),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 3,
                                    right: 162,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Registrarse',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                          color: Color(0xFF238F8F),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                //1. Nombre
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: nombre,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese el nombre de su empresa';
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
                                      hintText: 'Nombre empresa',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 5),
                                //2. Email
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: email,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese correo electrónico de empresa';
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
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                //4. CONTRASEÑA
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
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
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(() {
                                          obscurePassword = !obscurePassword;
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '¿Ya tienes cuenta? ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    InkWell(
                                      child: GestureDetector(
                                        child: Text(
                                          'Iniciar sesión',
                                          style: TextStyle(
                                            color: Color(0xFF238F8F),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () => Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginAdmin())),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (formKeyFour.currentState!
                                          .validate()) {
                                        insertUser();
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 10, top: 20),
                                    width: 325, // Ancho original del botón
                                    height: 45,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF238F8F),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Registrar',
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
