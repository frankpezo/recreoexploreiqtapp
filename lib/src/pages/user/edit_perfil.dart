import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/componentes/controller.dart';
import 'package:recreoexploreiqtapp/model/user_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottom_UserNav.dart';
import 'package:recreoexploreiqtapp/src/pages/user/profile_screen.dart';

class EditPefil extends StatefulWidget {
  final ModelUser userEdt;
  EditPefil({Key? key, required this.userEdt}) : super(key: key);

  @override
  State<EditPefil> createState() => _EditPefilState();
}

class _EditPefilState extends State<EditPefil> {
  //1. Variables de los campos
  TextEditingController id = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController imgUser = TextEditingController();
  //1.1. Contraseña password
  bool obscurePassword = true;

  //Api
  Future<void> modifyUser() async {
    if (nombre.text.isNotEmpty &&
        apellido.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      print("Se modificó datos con éxito");
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

  //Para traer los datos desde la otra página
  @override
  void initState() {
    super.initState();
    // Inicializar los controladores de los campos de texto con los datos del usuario
    id.text = widget.userEdt.id.toString();
    nombre.text = widget.userEdt.nombreUser;
    apellido.text = widget.userEdt.apellidoUser;
    email.text = widget.userEdt.emailUser;
    password.text = widget.userEdt.passwordUser;
    imgUser.text = widget.userEdt.imgUser;
    // Puedes inicializar el campo de contraseña si es necesario
    // password.text = widget.userEdt.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKeyFive,
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                          top: 8,
                          right: 320,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavUser(
                                  user: widget.userEdt,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: Colors
                                .black, // Puedes cambiar el color según tus preferencias
                          ),
                        )),
                    Text(
                      'Editar perfil',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
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
                                SizedBox(height: 15),

                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 3,
                                    right: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/${widget.userEdt.imgUser}'),
                                            radius: 35,
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                // Aquí puedes agregar la lógica para editar el perfil
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.orangeAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                //ID
                                Visibility(
                                  visible: false,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: 325,
                                    height: 70,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 15),
                                    child: TextFormField(
                                      controller: id,
                                      obscureText: false,
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Su id no es válido';
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
                                        hintText: 'id',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
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
                                SizedBox(height: 2),
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
                                SizedBox(height: 2),
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
                                SizedBox(height: 2),
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

                                SizedBox(height: 2),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (formKeyFive.currentState!
                                          .validate()) {}
                                    });
                                    modifyUser();
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
                                        'Modificar perfil',
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
