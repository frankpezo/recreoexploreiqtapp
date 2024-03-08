import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';

import 'package:recreoexploreiqtapp/src/pages/admin/viewAdminCard.dart';

class CardEdRegister extends StatefulWidget {
  //Traemos los datos necesarios
  final EmpresaModel? empresaCER;
  final LocalModel? localCER;
  final int? idEmpresaCER;
  final int? idlocalCER;
  final String? emailCER;
  //Los datos
  /*  final int? idLocalCER;
  final String? nombreLocalCER;
  final String?  */
  CardEdRegister({
    Key? key,
    this.empresaCER,
    this.idEmpresaCER,
    this.idlocalCER,
    this.emailCER,
    this.localCER,
  }) : super(key: key);

  @override
  State<CardEdRegister> createState() => _CardEdRegisterState();
}

class _CardEdRegisterState extends State<CardEdRegister> {
  //11. TREAMOS EL ID
  LocalModel? _local;
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
  String? imgLocal = '';
  List<String> keywords = []; //Lista donde se almacenará las palabras claves

  //1.1.  Inicalizamos los campos
  @override
  void initState() {
    super.initState();
    _loadLocalData();
  }

  //1. Obtener info por medi de idLocal
  // 1. Obtener info por medio de idLocal
  Future<void> _loadLocalData() async {
    Databasehelper dbHelper = Databasehelper.instance;
    List<Map<String, dynamic>> localData =
        await dbHelper.traerLocalPorId(widget.idlocalCER);
    if (localData.isNotEmpty) {
      setState(() {
        _local = LocalModel.fromMap(localData.first);
        // Asignación de valores después de verificar que _local no sea null
        imgLocal = _local?.imageLocal ?? '';
        nombreLocal.text = _local?.nombreLocal ?? '';
        direccionLocal.text = _local?.direccionLocal ?? '';
        selectedValue = _local?.distritoLocal ?? '';
        telefono.text = _local?.telefonoLocal ?? '';
        horario.text = _local?.horarioLocal ?? '';
        descripcion.text = _local?.descripcionLocal ?? '';
        palabrasCLave.text = _local?.palabrasClaves?.join(', ') ?? '';
        ninos.text = _local?.ninoPrice ?? '';
        adulto.text = _local?.adultoPrice ?? '';
        turista.text = _local?.turistaPrice ?? '';
        feriado.text = _local?.feriadoPrice ?? '';
        _status = _local?.estadoLocal ?? 'Abierto'; // Valor predeterminado
      });
    }
  }

  // 2. Función para insertar local
  Future<void> modificarLocal() async {
    if (nombreLocal.text.isNotEmpty &&
        direccionLocal.text.isNotEmpty &&
        telefono.text.isNotEmpty &&
        horario.text.isNotEmpty &&
        descripcion.text.isNotEmpty &&
        keywords
            .isNotEmpty && // Al menos una palabra clave debe estar ingresada
        _status != null) {
      try {
        print(imgLocal);
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
        print(widget.idEmpresaCER);

        // El local no existe, proceder con el registro
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
            estadoLocal: _status,
            idEmpresa: widget.idEmpresaCER);
        local.idLocal = widget.idlocalCER;

        // 2.2. Condicional para que se realice el registro
        if (widget.localCER == null) {
          //Para hacer la actualización
          await Databasehelper.instance.actualizarLocal(local);
          print("Se modificó local con éxito");
          //await Databasehelper.instance.mostrarLocales();
          /*
          //traemos el id del local
          int? idDelLocal = await Databasehelper.instance
              .obtenerIdLocal('${nombreLocal.text}'); */
          /*  Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CardInsta(
                        idEmpresaCI: widget.idECR,
                        idLocalCI: idDelLocal,
                      ))); */
          /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 36, 246, 116),
            content: Text(
              'Se registró local con éxito',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 5),
          )); */
        }
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
            key: formKeySeven, // Asignar la nueva GlobalKey al Form
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
                                  builder: (context) => ViewCardAdmin(
                                    idEmpresaVC: widget.idEmpresaCER,
                                    idlocalVC: widget.idlocalCER,
                                    emailVC: widget.emailCER,
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
                                            color: Color(0xFF238F8F))),
                                    Text(
                                        "idEmpresa: ${widget.idEmpresaCER} - Localid: ${widget.idlocalCER}"),
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
                                            backgroundImage:
                                                AssetImage('${imgLocal}'),
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
                                      150, // Ajuste de altura para mostrar las palabras clave
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
                                          height:
                                              4), // Espacio entre el campo de texto y las palabras clave
                                      Wrap(
                                        spacing:
                                            4.0, // Espacio entre las palabras clave
                                        children: keywords.map((keyword) {
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
                                      if (formKeySeven.currentState!
                                          .validate()) {
                                        modificarLocal();
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
                                        'Modificar local',
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
