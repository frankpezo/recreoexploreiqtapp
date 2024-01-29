import 'package:flutter/material.dart';

import '../../../componentes/controller.dart';

class LoginUser extends StatefulWidget {
  LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  //1.TextEditinController
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  //2. Creamos el método para consumir la Api
  Future<void> getDatos() async {
    if (user.text.isNotEmpty && password.text.isNotEmpty) {
      print("Campos llenos");
      //2.1. Hacemos un tryCatch
      /* try {
        //3. Traemos la url
        Uri url = Uri.parse('http://10.0.2.2/sigaePhp/selectData.php');
        //3.1. Hacemos la peticiónal body
        var res = await http
            .post(url, body: {'user': user.text, 'password': password.text});
        print(res.body); //Para ver si trae los datos

        //3.2. Convertimos la respuesta a json
        var response = jsonDecode(res.body);
        if (response.length != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(user.text)),
          );
          print('Ingresó con exito');
        } else {
          print('Falló');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 242, 48, 48),
            content: Text(
              'Los datos no coinciden',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 5),
          ));
        }
      } catch (e) {
        print(e);
      }*/
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 242, 48, 48),
        content: Text(
          'Los campos no pueden quedar vacíos',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: Container(
        //Para fondo
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/icon1.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          margin: EdgeInsets.all(15),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 40, left: 10, right: 10),
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //1. Logo

                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 3, right: 230),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/icon2.1.png",
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  //2. Bievenido
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 3, right: 155),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Iniciar Sesión',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              color: Color(0xFF238F8F)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //3. Usuario campo
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: 325,
                                    height: 45,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 15),
                                    child: TextFormField(
                                      //2. Para acceder
                                      controller: user,
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
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  //4. Contraseña campo
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: 325,
                                    height: 45,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 15),
                                    child: TextFormField(
                                      //2. Para acceder
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
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '¿Aún no tienes cuenta? ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700]),
                                      ),
                                      InkWell(
                                        child: GestureDetector(
                                            child: Text(
                                              'Registrarse',
                                              style: TextStyle(
                                                  color: Color(0xFF238F8F),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              /* Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SupportTeam()),*
                                );*/
                                            }),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //5. Boton iniciar sesción
                                  GestureDetector(
                                    //1. Para que nos lleve a la página deseada
                                    onTap: () {
                                      setState(() {
                                        if (formKey.currentState!.validate()) {}
                                      });
                                      //
                                      //
                                      getDatos();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 10, top: 20),
                                      width: 310,
                                      height: 45,
                                      padding: const EdgeInsets.only(
                                          top: 3, left: 10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF238F8F),
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                  //6. No se acuerda contraseña
                                ],
                              ),
                            ),
                          )),
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
