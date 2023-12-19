import 'package:flutter/material.dart';
import 'package:appp/components/info_card.dart';
import 'package:appp/utils/game_utils.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue, // Color de la barra de la aplicación
        hintColor: Colors.lightBlue, // Color de acento para botones, etc.
        scaffoldBackgroundColor: Colors.lightBlue, // Color de fondo de la pantalla
      ),
      home: LoginScreen(),
    );
  }
}



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.blue; // Puedes cambiar este color según tus preferencias

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Iniciar sesión",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginForm(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistroScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                // Establece el color de fondo del botón
              ),
              child: Text("Registro"),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registro",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: RegistroForm(),
      ),
    );
  }
}

class RegistroForm extends StatefulWidget {
  const RegistroForm({Key? key}) : super(key: key);

  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  void _realizarRegistro() {
    String nombre = _nombreController.text;
    String contrasena = _contrasenaController.text;

    if (nombre.isNotEmpty && contrasena.isNotEmpty) {
      // Registro exitoso
      _mostrarDialog("Registro exitoso", "Nombre: $nombre\nContraseña: $contrasena");
      // Limpia los campos después de mostrar el mensaje
      _nombreController.clear();
      _contrasenaController.clear();
    } else {
      // Campos vacíos, muestra un mensaje de error
      _mostrarDialog("Error", "Por favor, completa todos los campos.");
    }
  }

  void _mostrarDialog(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _nombreController,
            decoration: InputDecoration(
              labelText: "Nombre",
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),

          SizedBox(height: 16.0),

          TextFormField(
            controller: _contrasenaController,
            decoration: InputDecoration(
              labelText: "Contraseña",
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),

          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _realizarRegistro,
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            child: Text(
              "Realizar Registro",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



//clase sin usar, para json
class Usuario {
  String nombre;
  String contrasena;

  Usuario(this.nombre, this.contrasena);

  // Método para convertir el objeto a un mapa (JSON)
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'contrasena': contrasena,
    };
  }
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      map['nombre'],
      map['contrasena'],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Simulación de credenciales (usuario = "u", contraseña = "c")
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "u" && password == "c") {
      // Credenciales válidas, redirige a la pantalla de niveles
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LevelsScreen()),
      );
    } else {
      // Muestra un mensaje de error si las credenciales son incorrectas
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error de inicio de sesión"),
            content: const Text("Credenciales incorrectas. Intenta de nuevo."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Usuario",
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white, // Color de fondo
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue), // Cambia el color del borde cuando el campo está enfocado
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Cambia el color del borde cuando el campo no está enfocado
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Contraseña",
              labelStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white, // Color de fondo
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue), // Cambia el color del borde cuando el campo está enfocado
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Cambia el color del borde cuando el campo no está enfocado
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _login,
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // Color del botón
              onPrimary: Colors.black, // Color del texto en el botón
            ),
            child: Text("Iniciar sesión"),
          ),
        ],
      ),
    );
  }
}
// Función para registrar un nuevo usuario
void registrarUsuario(String nombre, String contrasena) {
  // Crear una instancia de Usuario con los datos proporcionados
  Usuario nuevoUsuario = Usuario(nombre, contrasena);

  // Convertir el usuario a un mapa (JSON)
  Map<String, dynamic> usuarioMap = nuevoUsuario.toMap();

  // Convertir el mapa a una cadena JSON
  String usuarioJson = jsonEncode(usuarioMap);

  // Guardar la cadena JSON en un archivo
  File file = File('data/registros.json');

  // Verificar si el archivo ya existe
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  // Abrir el archivo en modo de escritura
  IOSink sink = file.openWrite(mode: FileMode.append);

  // Escribir la cadena JSON en el archivo
  sink.write('$usuarioJson\n');

  // Cerrar el archivo
  sink.close();
}

bool verificarCredenciales(String nombre, String contrasena) {
  // Leer el archivo de usuarios
  File file = File('data/registros.json');

  if (!file.existsSync()) {
    // El archivo no existe, por lo que el usuario no está registrado
    return false;
  }

  // Leer el contenido del archivo
  String fileContents = file.readAsStringSync();

  // Dividir las líneas del archivo
  Iterable<String> lines = LineSplitter.split(fileContents);

  // Buscar en cada línea si coincide con las credenciales proporcionadas
  for (String line in lines) {
    Map<String, dynamic> usuarioMap = jsonDecode(line);

    Usuario usuario = Usuario.fromMap(usuarioMap);

    if (usuario.nombre == nombre && usuario.contrasena == contrasena) {
      // Las credenciales coinciden, el usuario está registrado
      return true;
    }
  }

  // No se encontraron coincidencias
  return false;
}

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nivel",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        color: Colors.lightBlue, // Color de fondo del área de niveles
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selecciona un nivel",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20),

              LevelCard(
                level: "Fácil",
                textColor: Colors.black,
                backgroundColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(level: "Fácil")),
                  );
                },
              ),
              LevelCard(
                level: "Medio",
                textColor: Colors.black,
                backgroundColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(level: "Medio")),
                  );
                },
              ),
              LevelCard(
                level: "Difícil",
                textColor: Colors.black,
                backgroundColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(level: "Difícil")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final String level;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;

  const LevelCard({
    Key? key,
    required this.level,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: backgroundColor,
        child: ListTile(
          title: Text(
            level,
            style: TextStyle(color: textColor), // Establece el color del texto
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  final String level;

  const HomeScreen({Key? key, required this.level}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  //setting text style
  TextStyle whiteText = const TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  //game stats
  int score = 0;
  Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    _game.initGame();
    startTimer();
  }

  void startTimer() {
    stopwatch.start();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  bool allCardsMatched() {
    // Verifica si todas las cartas han sido emparejadas
    return _game.gameImg!.every((card) => card == _game.hiddenCardpath);
  }

  void showWinAlert() {
    // Muestra un diálogo de alerta
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¡Has ganado!"),
          content: Text("Puntaje: $score\nTiempo: ${formatTime(stopwatch.elapsed.inSeconds)}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  int getCrossAxisCount() {
    if (widget.level == "Fácil") {
      return 4;
    } else if (widget.level == "Medio") {
      return 6;
    } else if (widget.level == "Difícil") {
      return 8;
    } else {
      return 4;
    }
  }

  String formatTime(int seconds) {
    int minutes = (seconds ~/ 60);
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    int secondsElapsed = stopwatch.elapsed.inSeconds;
    return Scaffold(
      backgroundColor: Color(0xFF41C0F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LevelsScreen()),
                  );
                },
                child: Icon(Icons.arrow_back, color: Colors.black), // Usamos 'child' en lugar de 'icon'
              ),

              info_card("Tiempo", formatTime(secondsElapsed)),
              info_card("Puntaje", "$score"),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              itemCount: _game.gameImg!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Lógica del juego...
                    print(_game.matchCheck);
                    setState(() {
                      _game.gameImg![index] = _game.cards_list[index];
                      _game.matchCheck.add({index: _game.cards_list[index]});
                      print(_game.matchCheck.first);
                    });
                    if (_game.matchCheck.length == 2) {
                      if (_game.matchCheck[0].values.first ==
                          _game.matchCheck[1].values.first) {
                        print("true");
                        //incrementing the score
                        score += 100;
                        _game.matchCheck.clear();
                      } else {
                        print("false");

                        Future.delayed(Duration(milliseconds: 500), () {
                          print(_game.gameColors);
                          setState(() {
                            _game.gameImg![_game.matchCheck[0].keys.first] =
                                _game.hiddenCardpath;
                            _game.gameImg![_game.matchCheck[1].keys.first] =
                                _game.hiddenCardpath;
                            _game.matchCheck.clear();
                          });
                        });
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(9.0),
                      image: DecorationImage(
                        image: AssetImage(_game.gameImg![index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
