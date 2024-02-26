//1. importamos el paquete de SQLLITE Y PATH
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
  static const _tblPuntuacionLocal = "Puntuacion_Local"; //usuario
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
      idUsuario INTEGER PRIMARY KEY, 
      nombreUsuario TEXT NOT NULL, 
      apellidoUsuario TEXT NOT NULL, 
      emailUsuario TEXT NOT NULL, 
      passwordUsuario TEXT NOT NULL,
      imgUsuario TEXT NOT NULL,
    )
''');
    //Taba PUNTUACIÓN
    await db.execute('''
   CREATE TABLE $_tblPuntuacion(
    idPuntuacion INTEGER PRIMARY KEY, 
    punto REAL NOT NULL, 
    comentario TEXT NOT NULL, 
    idUsuario INTEGER; 
   )
''');

    //Tabla EMPRESA
    await db.execute('''
    CREATE TABLE $_tblEmpresa(
      idEmpersa INTEGER PRIMARY KEY, 
      nombreEmpresa TEXT NOT NULL, 
      emailEmpresa TEXT NOT NULL, 
      passwordEmpresa TEXT NOT NULL, 
      imgEmpresa TEXT NOT NULL
    )
''');

    //Tabla Local
    await db.execute('''
     CREATE TABLE $_tblLocal(
      idLocal INTEGER PRIMARY KEY, 
      nombreLocal TEXT NOT NULL, 
      distrito Local TEXT NOT NULL, 
      telefonoLocal INTEGER NOT NULL, 
      descripcionLocal TEXT NOT NULL, 
      palabrasClaves TEXT NOT NULL, 
      ninoPrice REAL NOT NULL, 
      adultoPrice REAL NOT NULL, 
      turistaPrice REAL NOT NULL, 
      feriadoPrice REAL NOT NULL, 
      estadoLocal TEXT NOT NULL 
      idEmpresa INTEGER, 
     )
  ''');

    //Tabla INSTALACIONES
    await db.execute('''
 CREATE TABLE $_tblInstalaciones(
  idInstalaciones INTEGER PRIMARY KEY, 
  nombreInstalacion TEXT NOT NULL, 
 )
''');

    //Tabla IMAGEN
    await db.execute('''
    CREATE TABLE $_tblImagen(
      idImagen INTEGER PRIMARY KEY, 
      img1 TEXT NOT NULL, 
      img2 TEXT NOT NULL, 
      img3 TEXT NOT NULL, 
      img4 TEXT NOT NULL, 
      img5 TEXT NOT NULL, 
      img6 TEXT NOT NULL, 
      img7 TEXT NOT NULL, 
      img8 TEXT NOT NULL, 
      img9 TEXT NOT NULL, 
      img10 TEXT NOT NULL, 
    )
''');
//TABLAS INTERMEDIAS
    //Tabla PUNTUACIÓN_LOCAL
    await db.execute('''
   CREATE TABLE $_tblPuntuacionLocal(
    idLocal INTEGER, 
    idPuntuacion INTEGER, 
    FOREIGN KEY(idLocal) REFERENCES $_tblLocal(idLocal),
    FOREIGN KEY(idPuntuacion) REFERENCES $_tblPuntuacion(idPuntuacion),

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
      FOREIGN KEY(idInstalaciones) REFERENCES $_tblInstalaciones(idInstalaciones),
     )
    ''');
  }

//6. Operaciones para el crud en cada sección
//6.1. Registro de empresa
}
