import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/Food.dart';
import 'package:flutter_application_1/Screens/Routines.dart';
import 'package:flutter_application_1/Screens/Selection.dart';
import 'package:flutter_application_1/Screens/T&C.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Settings extends StatefulWidget {
  final String title;
  int id;
  String condicion;
  Settings(
      {required this.id,
      Key? key,
      required this.title,
      required this.condicion})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Settings> {
  final prefs = UserPrefs();
  String selectedButton = ''; 
  int _currentIndex = 0; 
  final PanelController _panelController = PanelController();

  List food_preferences = [];
  TextEditingController lastpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> changePassword() async {
    for (int i = 0; i < usersList.length; i++) {
      if (widget.id == usersList[i]['user_id']) {
        if (prefs.password == lastpasswordController.text &&
            passwordController.text != '' &&
            repeatpasswordController.text == passwordController.text) {
          usersList[i]['password'] = passwordController.text;
          prefs.password = usersList[i]['password'];
          print('contrasenna cambiada con exito');
        } else {
          print('falta llenar correctamente algun campo');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + 20.0), // Ajusta la altura del AppBar
        child: AppBar(
          backgroundColor: Color(0xFFFAF6F5),
          automaticallyImplyLeading: false, // Deshabilita el botón de retroceso
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                    top: 15.0,
                    right:
                        20.0), // Ajusta el espacio hacia abajo y a la derecha
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: size.width * 0.08,
                    color: Color(0xFF492D25),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Abre el Drawer
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Container(
        width: size.width * 0.6,
        child: Drawer(
          backgroundColor: Color(0xFFcec1b8),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.15),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: size.width * 0.2,
                        color: Color.fromRGBO(73, 45, 37, 1),
                      ),
                      Text(
                        prefs.username,
                        style: GoogleFonts.fredoka(
                          textStyle: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF492D25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.055),
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                Color(0xFF492D25), // Color de fondo del botón
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Selection(
                                    id: widget.id,
                                    codicion: '',
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Add Food',
                              style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.025),
                        child: Container(
                          height: 0.5, // Grosor de la línea
                          width: size.width * 0.36, // Longitud de la línea
                          color: Color(0xFF492D25), // Color de la línea
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.13),
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:
                                Color(0xFF492D25), // Color de fondo del botón
                          ),
                          child: TextButton(
                            onPressed: () {
                              prefs.email = '';
                              prefs.password = '';
                              prefs.username = '';
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login(
                                          title: 'Login',
                                          id: 1,
                                        )),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Text(
                              'Logout',
                              style: GoogleFonts.fredoka(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.025,
                            bottom: size.height * 0.02),
                        child: Image.asset(
                          "assets/Nutry.png",
                          height: size.height * 0.15,
                          width: size.height * 0.15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Aquí puedes agregar la navegación a la pantalla de login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Terminos(
                                      condicion: widget.condicion,
                                      id: widget.id,
                                    )),
                          );
                        },
                        child: Text('T&C',
                            style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(139, 133, 128, 1.0),
                            ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Text('Version 1',
                            style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(139, 133, 128, 1.0),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAF6F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.04, left: size.width * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: size.width * 0.25,
                      color: Color(0xFF492d25),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: GoogleFonts.fredoka(
                              textStyle: TextStyle(
                                fontSize: size.width * 0.09,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF492D25),
                              ),
                            ),
                          ),
                          Text(
                            prefs.username,
                            style: GoogleFonts.fredoka(
                              textStyle: TextStyle(
                                fontSize: size.width * 0.06,
                                color: Color(0xFF492D25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Nueva Columna con información del usuario
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email: ${prefs.email}',
                    style: GoogleFonts.fredoka(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF492D25),
                      ),
                    ),
                  ),
                  Text(
                    'User ID: ${widget.id}',
                    style: GoogleFonts.fredoka(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF492D25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Segunda Columna (Divider)
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05, bottom: size.height * 0.02),
              height: 1,
              width: size.width * 0.9,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Text(
                'Por seguridad, introduce tu contraseña para continuar.',
                style: GoogleFonts.fredoka(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8A6B57),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextField(
                  controller: lastpasswordController,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromRGBO(73, 45, 37, 1.0)),
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: Color.fromRGBO(73, 45, 37, 1)),
                      hintText: 'Last Password',
                      hintStyle: TextStyle(
                          fontFamily: 'fredoka',
                          color: Color.fromRGBO(205, 188, 174, 1)),
                      contentPadding: EdgeInsets.all(20),
                      //para darle forma a simple vista
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(73, 45, 37, 1))),
                      //es para darle forma cuando le das click
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(73, 45, 37, 1)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromRGBO(73, 45, 37, 1.0)),
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: Color.fromRGBO(73, 45, 37, 1)),
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                          fontFamily: 'fredoka',
                          color: Color.fromRGBO(205, 188, 174, 1)),
                      contentPadding: EdgeInsets.all(20),
                      //para darle forma a simple vista
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(73, 45, 37, 1))),
                      //es para darle forma cuando le das click
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(73, 45, 37, 1)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextField(
                  controller: repeatpasswordController,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromRGBO(73, 45, 37, 1.0)),
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: Color.fromRGBO(73, 45, 37, 1)),
                      hintText: 'Repeat Password',
                      hintStyle: TextStyle(
                          fontFamily: 'fredoka',
                          color: Color.fromRGBO(205, 188, 174, 1)),
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(73, 45, 37, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(73, 45, 37, 1)))),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            ElevatedButton(
              onPressed: () {
                changePassword();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            id: 1,
                            title: '',
                            condicion: '',
                            routines: '',
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF492D25),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: size.height * 0.01), // Ajusta el ancho del botón
              ),
              child: Text(
                'Confirm',
                style: GoogleFonts.fredoka(
                    textStyle: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
