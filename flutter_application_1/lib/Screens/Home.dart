import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/Food.dart';
import 'package:flutter_application_1/Screens/Routines.dart';
import 'package:flutter_application_1/Screens/Selection.dart';
import 'package:flutter_application_1/Screens/Settings.dart';
import 'package:flutter_application_1/Screens/T&C.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

Map<String, dynamic> food_like = {};

class Home extends StatefulWidget {
  final String title;
  String routines;
  int id;
  String condicion;
  Home(
      {required this.id,
      Key? key,
      required this.title,
      required this.condicion, required this.routines})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final prefs = UserPrefs();
  String selectedButton = ''; // Estado para rastrear el botón seleccionado

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<String> recetas = [];

  Future<void> getData() async {
    for (int i = 0; i < usersList.length; i++) {
      if (widget.id == usersList[i]['user_id']) {
        food_like = usersList[i]['food_preferences']['food_like'];
        food_like.forEach((key, value) {
          recetas.addAll(value['Recetas'].keys.toList());
        });
        print(usersList[i]);
      }
    }
    print(recetas);
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
                                    codicion: widget.condicion,
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
                        padding: EdgeInsets.only(top: size.height * 0.040),
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
                                  builder: (context) => Settings(
                                    title: "Aqui va settings",
                                    id: widget.id,
                                    condicion: widget.condicion,
                                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            // Segunda Columna (Divider)
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05, bottom: size.height * 0.02),
              height: 1,
              width: size.width * 0.9,
              color: Colors.black,
            ),

            SizedBox(height: size.height * 0.04),

            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.002, horizontal: size.width * 0.15),
              child: SizedBox(
                width: size.width * 0.7,
                child: widget.routines == 'No' ? Container(): Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color(0xffCDBCAE),
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Routines(
                            id: widget.id,
                            condicion: widget.condicion,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fitness_center,
                            size: size.width * 0.09,
                            color: Color(0xFF3B0000),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            'SEE ROUTINES',
                            style: GoogleFonts.fredoka(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B0000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.010, horizontal: size.width * 0.22),
              child: Text(
                'RECIPES PREFERENCES',
                style: GoogleFonts.fredoka(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B0000),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04),

            Container(
              height: MediaQuery.of(context).size.height *
                  0.6, // Tamaño específico para el ListView.builder
              child: ListView.builder(
                itemCount: recetas.length, // Cantidad de elementos en la lista
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Food(
                            nombrereceta: recetas[index],
                            id: widget.id,
                            condicion: widget.condicion,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.04),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/PolloEsparragos.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Flexible(
                            child: Text(
                              recetas[index],
                              style: GoogleFonts.fredoka(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8A6B57),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
