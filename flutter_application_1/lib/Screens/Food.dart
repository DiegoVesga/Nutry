import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/Selection.dart';
import 'package:flutter_application_1/Screens/Settings.dart';
import 'package:flutter_application_1/Screens/T&C.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';
import 'package:flutter_application_1/main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Food extends StatelessWidget {
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
                                id: 1,
                                title: '',
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
                        'Nombre de usuario', // Aquí puedes poner el nombre del usuario dinámicamente
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
                        'Nombre de la persona',
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
                                  builder: (context) => Selection(),
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
                                    id: 1,
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
                            MaterialPageRoute(builder: (context) => Terminos()),
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
      body: Container(
        color: Color(0xffFAF6F5),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
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
                          "assets/PolloEsparragos.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Text(
                  'Pollo a la parrilla \n con espárragos y \n champiñones',
                  style: GoogleFonts.fredoka(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8A6B57),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width *
                    0.1, // 10% del ancho de la pantalla
                vertical: MediaQuery.of(context).size.height *
                    0.03, // 3% de la altura de la pantalla
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proteina: ',
                        style: GoogleFonts.fredoka(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFf492D25),
                        ),
                      ),
                      Text(
                        'Pollo',
                        style: GoogleFonts.fredoka(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFf8A6B57),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredientes: ',
                        style: GoogleFonts.fredoka(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFf492D25),
                        ),
                      ),
                      Text(
                        'Pechuga de pollo, espárragos,champiñones, aceite de oliva, ajo, sal, pimienta',
                        style: GoogleFonts.fredoka(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFf8A6B57),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preparacion: ',
                        style: GoogleFonts.fredoka(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFf492D25),
                        ),
                      ),
                      Text(
                        '1. Sazona la pechuga de pollo con sal y pimienta. \n 2.Cocina a la parrilla hasta que esté bien cocida. \n 3.En una sartén, saltea los espárragos y los champiñones con un poco de aceite de oliva y ajo picado. \n 4.Sirve el pollo acompañado de los espárragos y champiñones. ',
                        style: GoogleFonts.fredoka(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFf8A6B57),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
