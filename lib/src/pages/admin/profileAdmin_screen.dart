import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/db/database_helper.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/edProfileAd.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/login_admin.dart';
import 'package:recreoexploreiqtapp/src/pages/welcome_splash.dart';

class ProfileAdminScreen extends StatefulWidget {
  final int? idEmpresP;
  final String? emailEP;
  ProfileAdminScreen({
    Key? key,
    this.idEmpresP,
    this.emailEP,

    /*  required this.empresaP */
  }) : super(key: key);

  @override
  State<ProfileAdminScreen> createState() => _ProfileAdminScreenState();
}

class _ProfileAdminScreenState extends State<ProfileAdminScreen> {
  //1.Usamos el Model de la empresa
  EmpresaModel? _empresa;
  //1.1. inicializar
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Aquí irá la función
    _loadEmpresaData();
  }

  //1.2.  Función para traer la data
  Future<void> _loadEmpresaData() async {
    Databasehelper dbHelper = Databasehelper.instance;
    List<Map<String, dynamic>> empresaData =
        await dbHelper.traerEmpresaPorId(widget.idEmpresP);
    if (empresaData.isNotEmpty) {
      setState(() {
        _empresa = EmpresaModel.fromMap(empresaData.first);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
            30), // Reducir el padding para dispositivos más pequeños
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo y título
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0), // Añadir espacio vertical
              child: Row(
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
            ),
            SizedBox(
              height: 30,
            ),
            // Aquí puedes agregar más elementos según sea necesario
            Expanded(
              child: Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mi Perfil",
                          style: TextStyle(fontSize: 17),
                        ),
                        /* Text(
                            'id: ${widget.idEmpresP} - email: ${widget.emailEP}'), */
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Ajustar el radio del borde del Card
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            children: [
                              // Imagen redonda y Nombre de usuario y Email
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(_empresa
                                            ?.imgEmpresa ??
                                        ''), // Ruta de la imagen del usuario
                                    radius: 35,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // Nombre de usuario y Email
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _empresa?.nombreEmpresa ??
                                            '', //Datos dinámicos
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        _empresa?.emailEmpresa ?? '',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Botones
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EdProfileAdmin(
                                                      idEmpresaCEP:
                                                          widget.idEmpresP,
                                                      emailCEP: widget.emailEP,
                                                    )));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .white, // Cambiar el color de fondo del botón
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Agregar un radio
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                86), // Ajustar el ancho del botón
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Icono a la izquierda del texto
                                          // Espacio entre el icono y el texto
                                          Text('Editar perfil',
                                              style: TextStyle(
                                                  color: Color(0xFF238F8F))),
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
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginAdmin()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .white, // Cambiar el color de fondo del botón
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Agregar un radio
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                84), // Ajustar el ancho del botón
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Icono a la izquierda del texto
                                          // Espacio entre el icono y el texto
                                          Text('Cerrar sesión',
                                              style: TextStyle(
                                                  color: Color(0xFF238F8F))),
                                          SizedBox(width: 10),
                                          Icon(
                                            Icons.exit_to_app,
                                            color: Color(0xFF238F8F),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    ElevatedButton(
                                      onPressed: () async {
                                        // Acción para eliminar cuenta
                                        await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  Text("Confirmar eliminación"),
                                              content: Text(
                                                  "¿Estás seguro que desea eliminar su perfil?"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Cerrar el diálogo
                                                  },
                                                  child: Text("Cancelar",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFF238F8F))),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    await Databasehelper
                                                        .instance
                                                        .eliminarEmpresa(
                                                            widget.idEmpresP);
                                                    //_cargarUsuarios();

                                                    Navigator.of(context)
                                                        .pop(); // Cerrar diálogo
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            WelcomeSplah(),
                                                      ),
                                                    );
                                                  },
                                                  child: Text("Eliminar",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .redAccent)),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .red, // Cambiar el color de fondo del botón
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Agregar un radio
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                75), // Ajustar el ancho del botón
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Icono a la izquierda del texto
                                          // Espacio entre el icono y el texto
                                          Text(
                                            'Eliminar cuenta',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
