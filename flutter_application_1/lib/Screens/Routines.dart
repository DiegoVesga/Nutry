import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/Selection.dart';
import 'package:flutter_application_1/Screens/Settings.dart';
import 'package:flutter_application_1/Screens/T&C.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';

import 'package:google_fonts/google_fonts.dart';

class Routines extends StatelessWidget {



final List<Map<String, String>> exercises = [
    {
      'title': 'Caminar:',
      'description': '''* Descripción: Es una actividad de bajo impacto que puede realizarse a diferentes intensidades.
* Beneficios: Mejora la circulación, ayuda a controlar el nivel de glucosa en sangre y es fácil de incorporar en la rutina diaria.
* Recomendaciones: Caminar al menos 30 minutos al día, cinco veces a la semana''',
    },
    {
      'title': 'Entrenamiento de Fuerza:',
      'description': '''* Descripción: Involucra el uso de pesas, bandas de resistencia o el peso corporal para fortalecer los músculos.
* Beneficios: Ayuda a aumentar la masa muscular, mejora la sensibilidad a la insulina y fortalece los huesos.
* Recomendaciones: Realizar ejercicios de fuerza dos a tres veces por semana, trabajando todos los grupos musculares principales.''',
    },
    {
      'title': 'Yoga:',
      'description': '''* Descripción: Combinación de posturas, respiración y meditación.
* Beneficios: Reduce el estrés, mejora la flexibilidad y el equilibrio, y puede ayudar a reducir los niveles de glucosa en sangre.
* Recomendaciones: Practicar yoga dos a tres veces por semana, con clases adaptadas al nivel de cada persona.''',
    },
  ];
  
  Future<void> loadRoutines () async {

  }

  int id = 0;
  String condicion;
  Routines({required this.id, required this.condicion,});
  final prefs = UserPrefs();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + 20.0), // Ajusta la altura del AppBar
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(0xffFAF6F5),
              automaticallyImplyLeading:
                  false, // Deshabilita el botón de retroceso
              title: Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                id: id,
                                title: '',
                                condicion: condicion,
                                routines: dropdownExercise,
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: size.width * 0.08,
                        color: Color(0xFF492D25),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        prefs
                            .username, // Aquí puedes poner el nombre del usuario dinámicamente
                        style: TextStyle(
                          color: Color(0xff8A6B57),
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      right: 20.0,
                    ), // Ajusta el espacio hacia abajo y a la derecha
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Container(
                height: 1,
                color: Color(0xFF492D25),
                margin: EdgeInsets.only(top: 10.0),
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
                        //prefs.username,
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
                                    id: id,
                                    codicion: condicion,
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
                                    id: id,
                                    condicion: condicion,
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
                              //prefs.email = '';
                              //prefs.password = '';
                              //prefs.username = '';
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
                            MaterialPageRoute(builder: (context) => Terminos(id: id, condicion: condicion,)),
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
      body: ListView.builder(
  itemCount: exercises.length + 2, // +2 para el encabezado y la imagen
  itemBuilder: (context, index) {
    if (index == 0) {
      return SizedBox(
        height: size.height * 0.05,
      );
    } else if (index == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/Ejercicio.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            'Exercises',
            style: GoogleFonts.fredoka(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w400,
              color: Color(0xFF8A6B57),
            ),
          ),
        ],
      );
    } else {
      final exercise = exercises[index - 2];
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
          vertical: size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise['title']!,
              style: GoogleFonts.fredoka(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Color(0xFf492D25),
              ),
            ),
            Text(
              exercise['description']!,
              style: GoogleFonts.fredoka(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
                color: Color(0xFf8A6B57),
              ),
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      );
    }
  },
),
    );
  }
}
