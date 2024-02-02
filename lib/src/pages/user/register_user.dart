import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/src/pages/user/login_user.dart';

import '../../../componentes/controller.dart';

class RegisterUser extends StatefulWidget {
  RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  //1. Text Controllers
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  List<dynamic> userData = []; //Nos servirá para el registro

  //2. Api para insertar en la bd
  Future<void> insertUser() async {
    if (nombre.text.isNotEmpty &&
        apellido.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      print("Registro con éxito");
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
            key: formKeyDos,
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
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
                                  padding: const EdgeInsets.only(
                                    top: 3,
                                    right: 230,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/icon2.1.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9),
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
                                        return 'Por favor, ingrese su nombre';
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
                                      hintText: 'Nombre',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                //2. Apellido
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: apellido,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese su apellido';
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
                                      hintText: 'Apellido',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                //3. Email
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
                                      hintText: 'Email',
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
                                                    LoginUser())),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (formKeyDos.currentState!
                                          .validate()) {}
                                    });
                                    insertUser();
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
