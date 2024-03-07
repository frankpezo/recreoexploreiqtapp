import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/componentes/controller.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:recreoexploreiqtapp/src/bottomNav/bottm_AdminNav.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/cardInsta.dart';
import 'package:sqflite/sqflite.dart';

class CardRegister extends StatefulWidget {
  final EmpresaModel? empresaCR;
  final LocalModel? localCR;

  CardRegister({
    Key? key,
    this.empresaCR,
    this.localCR,
  }) : super(key: key);

  @override
  State<CardRegister> createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  //1. Creamos los campos
  final GlobalKey<FormState> formKeySeven =
      GlobalKey<FormState>(); // Nueva GlobalKey
  //   TextEditingController imgUser = TextEditingController();
  //TextEditingController id = TextEditingController();
  TextEditingController nombreLocal = TextEditingController();
  TextEditingController direccionLocal = TextEditingController();
  String selectedValue = '';
  TextEditingController telefono = TextEditingController();
  TextEditingController horario = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController palabrasCLave = TextEditingController();
  TextEditingController ninos = TextEditingController();
  TextEditingController adulto = TextEditingController();
  TextEditingController turista = TextEditingController();
  TextEditingController feriado = TextEditingController();
  String? _status = 'Abierto';
  List<String> keywords = []; //Lista donde se almacenará las palabras claves

  //1.1.  Inicalizamos los campos
  @override
  void initState() {
    super.initState();
    if (widget.empresaCR != null) {
      nombreLocal.text = widget.localCR!.nombreLocal!;
      direccionLocal.text = widget.localCR!.direccionLocal!;
      selectedValue = widget.localCR!.distritoLocal!;
      telefono.text = widget.localCR!.telefonoLocal!;
      horario.text = widget.localCR!.horarioLocal!;
      descripcion.text = widget.localCR!.descripcionLocal!;
      palabrasCLave.text = widget.localCR!.palabrasClaves!.join(', ');
      ninos.text = widget.localCR!.ninoPrice!;
      adulto.text = widget.localCR!.adultoPrice!;
      turista.text = widget.localCR!.turistaPrice!;
      feriado.text = widget.localCR!.feriadoPrice!;
      _status = widget.localCR!.estadoLocal!;
    }
  }

  // 2. Función para insertar local
  Future<void> registrarLocal() async {
    if (nombreLocal.text.isNotEmpty &&
        direccionLocal.text.isNotEmpty &&
        telefono.text.isNotEmpty &&
        horario.text.isNotEmpty &&
        descripcion.text.isNotEmpty &&
        keywords
            .isNotEmpty && // Al menos una palabra clave debe estar ingresada
        _status != null) {
      try {
        print("Registro de local con éxito");

        print(nombreLocal.text);
        print(direccionLocal.text);
        print(selectedValue);
        print(telefono.text);
        print(horario.text);
        print(descripcion.text);
        print(keywords);
        print(ninos.text);
        print(adulto.text);
        print(turista.text);
        print(feriado.text);
        print(_status);

        // 2.1. Lógica de insertar en la bd sqlite
        String palabrasClavesString = keywords.join(', ');
        LocalModel local = LocalModel(
            imageLocal: "assets/images/10.jpg",
            nombreLocal: nombreLocal.text,
            direccionLocal: direccionLocal.text,
            distritoLocal: selectedValue,
            telefonoLocal: telefono.text,
            horarioLocal: horario.text,
            descripcionLocal: descripcion.text,
            palabrasClaves: keywords.toList(), // Convertir lista a cadena
            ninoPrice: ninos.text,
            adultoPrice: adulto.text,
            turistaPrice: turista.text,
            feriadoPrice: feriado.text,
            estadoLocal: _status);
        // 2.2. Condicional para que se realice el registro
        if (widget.localCR == null) {
          /* await Databasehelper.instance.insertLocal(local);
          print("Se regsitró local con éxito"); */

          print("Lista del local");
          await Databasehelper.instance.mostrarLocales();
        }

        /*    print("Subido");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 36, 246, 116),
        content: Text(
          'Se subió con éxito',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
      )); */
        //No llevará a la parte de seleccionar instalaciones
        /*  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardInsta(
            userI: widget.userCard,
          ),
        ),
      ); */
      } catch (e) {
        print("El error fue: ${e}");
      }
      // Lógica para consumir la API
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 242, 48, 48),
        content: Text(
          'Todos los campos deben ser completados, incluyendo al menos una palabra clave',
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

//Para que funcione las palabras claves
  void addKeyword(String keyword) {
    setState(() {
      if (!keywords.contains(keyword)) {
        keywords.add(keyword);
        palabrasCLave.text = keywords.join(", ");
      }
    });
  }

  void removeKeyword(String keyword) {
    setState(() {
      keywords.remove(keyword);
      palabrasCLave.text = keywords.join(", ");
    });
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
                                    empresaB: widget.empresaCR,
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
                                    keyboardType: TextInputType.text,
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
                                //Palabras claves
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height:
                                      190, // Ajuste de altura para mostrar las palabras clave
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
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
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500]),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              if (palabrasCLave
                                                  .text.isNotEmpty) {
                                                addKeyword(palabrasCLave.text);
                                                palabrasCLave.clear();
                                              }
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ), // Espacio entre el campo de texto y las palabras clave
                                      Wrap(
                                        spacing:
                                            4.0, // Espacio entre las palabras clave
                                        children:
                                            keywords.take(4).map((keyword) {
                                          return InputChip(
                                            label: Text(keyword),
                                            onDeleted: () {
                                              removeKeyword(keyword);
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 5),
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
                                          keyboardType: TextInputType.text,
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
                                          keyboardType: TextInputType.text,
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
                                          keyboardType: TextInputType.text,
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
                                          keyboardType: TextInputType.text,
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
                                      if (formKeySix.currentState!.validate()) {
                                        registrarLocal();
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
