import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  final String title;
  int id;
  Home({required this.id, Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final prefs = UserPrefs();
  String selectedButton = ''; // Estado para rastrear el botón seleccionado
  int _currentIndex = 0; // Índice de la página actual en el CarouselSlider
  final PanelController _panelController = PanelController();

  List food_preferences = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    for (int i = 0; i < usersList.length; i++) {
      if (widget.id == usersList[i]['user_id']) {
        food_preferences = usersList[i]['food_preferences'];
      }
    }
  }

  //desarrollo de la app

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
                    size: 45,
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
        width: 250,
        child: Drawer(
          backgroundColor: Color(0xFFcec1b8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 110,
                        color: Color.fromRGBO(73, 45, 37, 1),
                      ),
                      Text(
                        prefs.username,
                        style: GoogleFonts.fredoka(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF492D25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: Container(
                          height: 40,
                          width: 150,
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
                                  builder: (context) =>
                                      Login(title: "Aqui va settings"),
                                ),
                              );
                            },
                            child: Text(
                              'Settings',
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
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 40,
                          width: 150,
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
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          height: 0.5, // Grosor de la línea
                          width: 160, // Longitud de la línea
                          color: Color(0xFF492D25), // Color de la línea
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 20),
                        child: Image.asset(
                          "assets/Nutry.png",
                          height: 130,
                          width: 130,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Aquí puedes agregar la navegación a la pantalla de login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login(title: "T&C")),
                          );
                        },
                        child: Text('T&C',
                            style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(139, 133, 128, 1.0),
                            ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Version 1',
                            style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(139, 133, 128, 1.0),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              // Agrega más elementos del Drawer aquí según sea necesario
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAF6F5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primer Columna
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icono de persona con línea de división
                    Icon(
                      Icons.person_outline,
                      size: 100,
                      color: Color(0xFF492d25),
                    ),
                    SizedBox(
                        width: 16.0), // Espacio entre el icono y los textos
                    Expanded(
                      // Columna de textos
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: GoogleFonts.fredoka(
                              textStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF492D25),
                              ),
                            ),
                          ),
                          Text(
                            prefs.username,
                            style: GoogleFonts.fredoka(
                              textStyle: TextStyle(
                                fontSize: 20,
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
            // Segunda Columna (Divider)
            Container(
              margin: EdgeInsets.only(
                  left: 20, bottom: 20), // Espacio entre el texto y la línea
              height: 1, // Grosor de la línea
              width: MediaQuery.of(context).size.width *
                  0.9, // Longitud de la línea
              color: Colors.black, // Color de la línea
            ),

            // Tercer Columna (Row con botones)

            SizedBox(height: 30), // Espacio adicional hacia abajo

            // Cuarta Columna (Carousel Slider)
            
          ],
        ),
      
    );
  }


}
