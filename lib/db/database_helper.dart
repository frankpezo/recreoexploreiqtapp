//1. importamos el paquete de SQLLITE Y PATH
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/model/local_model.dart';
import 'package:recreoexploreiqtapp/model/places_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//1.1. Vamos a importar los modelos necesarios luego de crear las tablas

//2. Clase de la bd
class Databasehelper {
//2.1. Creamos los datos necesarios  de la bd
  static const _dbName = "dbRecreoExploreIQT.db";
  static const _dbVersion = 1;
//2.2. Creamos las tablas
  //Tablas principales
  static const _tblUsuario = "Usuario";
  static const _tblPuntuacion = "Puntuacion";
  static const _tblEmpresa = "Empresa";
  static const _tblLocal = "Local";
  static const _tblInstalaciones = "Instalaciones";
  static const _tblImagen = "Imagen";
  //tablas intermedias
  static const _tblPuntuacionLocal = "Puntuacion_Local"; //user
  static const _tblIntalacionesImagen = "Instalaciones_Imagen";
  static const _tblLocalInstalaciones = "Local_Instalaciones";

//3. Creamos el constructor y la instancia de la clase
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();
//3.1. Verificamos si existe una referencia a  la bd
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase(); //Función que contendrá la inicialización
    return _database!;
  }

//4. Función que contendrá la inicialización
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    //Retornamos y abrimos la base de datos
    return await openDatabase(path,
        version: _dbVersion,
        onCreate:
            _onCreate); //onCreate es la fucnión que contiene los campos de las tablas
  }

//5. Funciones que contiene campos en las tablas
  Future _onCreate(Database db, int version) async {
    //Tabla Usuario
    await db.execute('''
    CREATE TABLE $_tblUsuario(
      idUsuario INTEGER PRIMARY KEY AUTOINCREMENT, 
      nombreUsuario TEXT NOT NULL, 
      apellidoUsuario TEXT NOT NULL, 
      emailUsuario TEXT NOT NULL, 
      passwordUsuario TEXT NOT NULL,
      imgUsuario TEXT NOT NULL
    )
''');
    /*    //Taba PUNTUACIÓN
    await db.execute('''
   CREATE TABLE $_tblPuntuacion(
    idPuntuacion INTEGER PRIMARY KEY AUTOINCREMENT, 
    punto REAL NOT NULL, 
    comentario TEXT NOT NULL, 
   FOREIGN KEY(idUsuario) REFERENCES $_tblUsuario(idUsuario)
   );
'''); */

    //Tabla EMPRESA
    await db.execute('''
    CREATE TABLE $_tblEmpresa(
      idEmpresa INTEGER PRIMARY KEY AUTOINCREMENT, 
      nombreEmpresa TEXT NOT NULL, 
      emailEmpresa TEXT NOT NULL, 
      passwordEmpresa TEXT NOT NULL, 
      imgEmpresa TEXT NOT NULL
    );
    ''');

    //Tabla Local
    await db.execute('''
     CREATE TABLE $_tblLocal(
      idLocal INTEGER PRIMARY KEY AUTOINCREMENT, 
      imageLocal TEXT NOT NULL, 
      nombreLocal TEXT NOT NULL, 
      direccionLocal TEXT NOT NULL,
      distritoLocal TEXT NOT NULL, 
      telefonoLocal TEXT NOT NULL, 
      horarioLocal TEXT NOT NULL, 
      descripcionLocal TEXT NOT NULL, 
      palabrasClaves TEXT NOT NULL, 
      ninoPrice TEXT NOT NULL, 
      adultoPrice TEXT NOT NULL, 
      turistaPrice TEXT NOT NULL, 
      feriadoPrice TEXT NOT NULL, 
      estadoLocal TEXT NOT NULL,
      idEmpresa INTEGER, -- Nueva columna para almacenar el ID de la empresa
     FOREIGN KEY(idEmpresa) REFERENCES $_tblEmpresa(idEmpresa)
     );
  ''');
/* 
    //Tabla INSTALACIONES
    await db.execute('''
 CREATE TABLE $_tblInstalaciones(
  idInstalaciones INTEGER PRIMARY KEY AUTOINCREMENT, 
  nombreInstalacion TEXT NOT NULL
 )
''');

    //Tabla IMAGEN
    await db.execute('''
    CREATE TABLE $_tblImagen(
      idImagen INTEGER PRIMARY KEY AUTOINCREMENT, 
      img1 TEXT NOT NULL, 
      img2 TEXT NOT NULL, 
      img3 TEXT NOT NULL, 
      img4 TEXT NOT NULL, 
      img5 TEXT NOT NULL, 
      img6 TEXT NOT NULL, 
      img7 TEXT NOT NULL, 
      img8 TEXT NOT NULL, 
      img9 TEXT NOT NULL, 
      img10 TEXT NOT NULL 
    )
''');
//TABLAS INTERMEDIAS
    //Tabla PUNTUACIÓN_LOCAL
    await db.execute('''
   CREATE TABLE $_tblPuntuacionLocal(
    idLocal INTEGER , 
    idPuntuacion INTEGER, 
    FOREIGN KEY(idLocal) REFERENCES $_tblLocal(idLocal),
    FOREIGN KEY(idPuntuacion) REFERENCES $_tblPuntuacion(idPuntuacion)

   )
''');

    //Tabla INSTALACIONES_IMAGEN
    await db.execute('''
    CREATE TABLE $_tblIntalacionesImagen(
       idInstalaciones INTEGER, 
       idImagen INTEGER, 
       FOREIGN KEY(idInstalaciones) REFERENCES $_tblInstalaciones(idInstalaciones),
       FOREIGN KEY(idImagen) REFERENCES $_tblImagen(idImagen)
    )
''');

    //tabla LOCAL_INSTALACIONES
    await db.execute('''
     CREATE TABLE $_tblLocalInstalaciones(
      idLocal INTEGER, 
      idInstalaciones INTEGER, 
      FOREIGN KEY(idLocal) REFERENCES $_tblLocal(idLocal),
      FOREIGN KEY(idInstalaciones) REFERENCES $_tblInstalaciones(idInstalaciones)
     )
    '''); */
  }

//6. Operaciones para el crud en cada sección
//6.1. EMPRESA
//Registro
  Future<int> insertEmpresa(EmpresaModel empresa) async {
    Database db = await instance
        .database; //Tuve que cambiar aquí para que pueda grabarse el id
    return await db.insert(_tblEmpresa, empresa.toMap());
  }

//Login
  Future<bool> loginEmpresa(String email, String password) async {
    Database db = await instance.database;
    // Recorremos con una lista
    List<Map<String, dynamic>> result = await db.query(
      _tblEmpresa,
      where: 'emailEmpresa = ?',
      whereArgs: [email],
    );

    // Si no se encuentra un usuario con ese email, retornar falso
    if (result.isEmpty) {
      return false;
    }

    // Verificar la contraseña (sensible a mayúsculas y minúsculas)
    String storedPassword = result.first['passwordEmpresa'];
    if (password.toLowerCase() == storedPassword.toLowerCase()) {
      return true; // Las contraseñas coinciden
    } else {
      return false; // Las contraseñas no coinciden
    }
  }

  //Para ver empresas registradas
  Future<void> mostrarEmpresas() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> userEmpresas = await db.query(_tblEmpresa);
    //Imrpimir en la terminal
    for (var user in userEmpresas) {
      print('Id: ${user['idEmpresa']}');
      print('Nombre: ${user['nombreEmpresa']}');
      print('Email: ${user['emailEmpresa']}');
      print('Password: ${user['passwordEmpresa']}');
      print('Imagen: ${user['imgEmpresa']}');
      print('--------------------------');
    }
  }

  Future<List<Map<String, dynamic>>> traerTodosEmpresas() async {
    Database db = await instance.database;
    return await db.query(_tblEmpresa);
  }

  //id de la Empresa
  Future<int?> obtenerIdEmpresaDesdeBD(String? emailEmpresa) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> empresas = await db.query(
      _tblEmpresa,
      where: 'emailEmpresa = ?',
      whereArgs: [emailEmpresa],
    );
    if (empresas.isNotEmpty) {
      return empresas.first['idEmpresa'] as int?;
    } else {
      return null;
    }
  }

// Obtener el ID de la empresa por su ID
/*   Future<int?> obtenerIdEmpresaDesdeBD(int idEmpresa) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> empresas = await db.query(
      _tblEmpresa,
      columns: ['idEmpresa'], // Seleccionar solo el ID de la empresa
      where: 'idEmpresa = ?',
      whereArgs: [idEmpresa],
    );
    if (empresas.isNotEmpty) {
      return empresas.first['idEmpresa'] as int?;
    } else {
      return null;
    }
  } */

  //6.2. Local
  //Registrar Local
  Future<int> insertLocal(LocalModel local) async {
    Database db = await instance.database;
    return await db.insert(_tblLocal, local.toMap());
  }

  //Mostrar locales registrados
  Future<void> mostrarLocales() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> locales = await db.query(_tblLocal);
    // Imprimir los locales en la terminal
    for (var local in locales) {
      print('Id: ${local['idLocal']}');
      print('Image: ${local['imageLocal']}');
      print('Nombre: ${local['nombreLocal']}');
      print('Dirección: ${local['direccionLocal']}');
      print('Distrito: ${local['distritoLocal']}');
      print('Teléfono: ${local['telefonoLocal']}');
      print('Horario: ${local['horarioLocal']}');
      print('Descripción: ${local['descripcionLocal']}');
      print('Palabras Claves: ${local['palabrasClaves']}');
      print('Precio para Niños: ${local['ninoPrice']}');
      print('Precio para Adultos: ${local['adultoPrice']}');
      print('Precio para Turistas: ${local['turistaPrice']}');
      print('Precio en Feriados: ${local['feriadoPrice']}');
      print('Estado: ${local['estadoLocal']}');
      print('Id de la Empresa: ${local['idEmpresa']}');
      print('--------------------------');
    }
  }
}
