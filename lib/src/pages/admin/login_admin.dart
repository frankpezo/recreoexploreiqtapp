import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/componentes/controller.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/register_admin.dart';

class LoginAdmin extends StatefulWidget {
  LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  //1. Controller para los campos
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  //1.1. Lista de usuario
  final List<EmpresaModel> userE = [
    EmpresaModel(
        id: 1,
        nombreEmpresa: "Cuistococha",
        emailEmpresa: "quistococha@gmail.com",
        passwordEmpresa: '12345',
        img: 'quisLogo.jpg'),
  ];

  //2. Para el Api
  Future<void> getDatos() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        final emailC = email.text.trim();
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
        } else {
          //print('falló');
          // Envolver el Scaffold con Builder para obtener un nuevo contexto
          /*  ScaffoldMessenger.of(context).showSnackBar(
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
          ); */
        }
      } catch (e) {
        String e = "fallo";
        print(e);
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
                                      hintText: 'Email empresa',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17),
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
                                        onTap: () => Navigator.pushReplacement(
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
                                          .validate()) {}
                                    });
                                    getDatos();
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
