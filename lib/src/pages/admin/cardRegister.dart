import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/componentes/controller.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardInsta.dart';

class CardRegister extends StatefulWidget {
  final EmpresaModel userCard;
  CardRegister({Key? key, required this.userCard}) : super(key: key);

  @override
  State<CardRegister> createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  final GlobalKey<FormState> formKeySix =
      GlobalKey<FormState>(); // Nueva GlobalKey

  TextEditingController nombreLocal = TextEditingController();
  TextEditingController direccionLocal = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController horario = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController palabrasCLave = TextEditingController();
  TextEditingController imgUser = TextEditingController();
  String selectedValue = '';
  TextEditingController ninos = TextEditingController();
  TextEditingController adulto = TextEditingController();
  TextEditingController turista = TextEditingController();
  TextEditingController feriado = TextEditingController();
  String? _status = 'Abierto';
  //Para mensaje de Scaffol
  Future<void> insertLocal() async {
    if (nombreLocal.text.isNotEmpty &&
        direccionLocal.text.isNotEmpty &&
        telefono.text.isNotEmpty &&
        horario.text.isNotEmpty &&
        descripcion.text.isNotEmpty &&
        palabrasCLave.text.isNotEmpty &&
        // imgUser.text.isNotEmpty &&
        ninos.text.isNotEmpty &&
        adulto.text.isNotEmpty &&
        turista.text.isNotEmpty &&
        feriado.text.isNotEmpty &&
        _status != null) {
      print("Registo de local con éxito");
      print("Subido");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 36, 246, 116),
        content: Text(
          'Se subió con éxito',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
      ));
      //No llevará a la parte de seleccionar instalaciones
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardInsta(
            userI: widget.userCard,
          ),
        ),
      );
      // Lógica para consumir la API
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 242, 48, 48),
        content: Text(
          'Todos los campos deben ser completados',
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
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKeySix, // Asignar la nueva GlobalKey al Form
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
                                  builder: (context) => BottomNavAdmin(
                                    user: widget.userCard,
                                  ),
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
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Datos del local",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF238F8F)))
                                  ],
                                ),
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
                                                'assets/images/profileGray.jpg'),
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
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: nombreLocal,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, nombre del local';
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
                                      hintText: 'Nombre del local',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: direccionLocal,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese la dirección';
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
                                      hintText: 'Dirección',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            100, // Ancho ajustado para alinear con otros campos
                                        child: Text(
                                          'Distrito',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF238F8F)),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              10), // Espacio entre el texto y la lista desplegable
                                      Container(
                                        width:
                                            200, // Ancho ajustado para la lista desplegable
                                        child: DropdownButton<String>(
                                          value: selectedValue,
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "", // Valor inicial vacío
                                              child:
                                                  Text('Seleccione una opción'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Iquitos',
                                              child: Text('Iquitos'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'San Juan Bautista',
                                              child: Text('San Juan Bautista'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Punchana',
                                              child: Text('Punchana'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Belén',
                                              child: Text('Belén'),
                                            ),
                                          ],
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedValue = value!;
                                              print(selectedValue);
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: telefono,
                                    obscureText: false,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese un teléfono';
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
                                      hintText: 'Teléfono',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: horario,
                                    obscureText: false,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese el horario de atención';
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
                                      hintText: 'Horario de atención',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: descripcion,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese una descripción';
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
                                      hintText: 'Descripción',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 70,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    controller: palabrasCLave,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese palabras claves';
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
                                      hintText: 'Palabras claves',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                //pRECIOS
                                //NIÑO
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Precios',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF238F8F)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Niños",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        width:
                                            100, // Aumenta el ancho del TextFormField
                                        height:
                                            40, // Aumenta la altura del TextFormField
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 15),
                                        child: TextFormField(
                                          controller: ninos,
                                          obscureText: false,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
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
                                            // Elimina el hintText
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //Adulto
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Adulto",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        width:
                                            100, // Aumenta el ancho del TextFormField
                                        height:
                                            40, // Aumenta la altura del TextFormField
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 15),
                                        child: TextFormField(
                                          controller: adulto,
                                          obscureText: false,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
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
                                            // Elimina el hintText
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //Turista
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Turista",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        width:
                                            100, // Aumenta el ancho del TextFormField
                                        height:
                                            40, // Aumenta la altura del TextFormField
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 15),
                                        child: TextFormField(
                                          controller: turista,
                                          obscureText: false,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
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
                                            // Elimina el hintText
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //Feriado
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Feriados",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        width:
                                            100, // Aumenta el ancho del TextFormField
                                        height:
                                            40, // Aumenta la altura del TextFormField
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 15),
                                        child: TextFormField(
                                          controller: feriado,
                                          obscureText: false,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
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
                                            // Elimina el hintText
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                //Radius
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 'Abierto',
                                          groupValue: _status,
                                          onChanged: (value) {
                                            setState(() {
                                              _status = value as String?;
                                              print(_status);
                                            });
                                          },
                                          activeColor: Color(0xFF238F8F),
                                        ),
                                        Text('Abierto'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 'Cerrado',
                                          groupValue: _status,
                                          onChanged: (value) {
                                            setState(() {
                                              _status = value as String?;
                                              print(_status);
                                            });
                                          },
                                          activeColor: Color(0xFF238F8F),
                                        ),
                                        Text('Cerrado'),
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (formKeySix.currentState!
                                          .validate()) {}
                                    });
                                    insertLocal();
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
                                        'Registrar local',
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
