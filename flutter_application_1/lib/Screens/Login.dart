import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  final String title;
  const Login({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/Inicio.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              right: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.height * 0.08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HELLO!',
                    style: GoogleFonts.fredoka(
                        textStyle: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(73, 45, 37, 1.0))),
                  ),
                  Text(
                    'lOG IN TO YOUR ACCOUNT',
                    style: GoogleFonts.fredoka(
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(138, 107, 87, 1.0))),
                  ),
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.10,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color.fromRGBO(73, 45, 37, 1.0)),
                      //obscureText: true, para el registro
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle,
                              color: Color.fromRGBO(73, 45, 37, 1)),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              fontFamily: 'fredoka',
                              color: Color.fromRGBO(205, 188, 174, 1)),
                          contentPadding: EdgeInsets.all(20),
                          //para darle forma a simple vista
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(73, 45, 37, 1))),
                          //es para darle forma cuando le das click
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(73, 45, 37, 1)))),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.10,
                      child: TextField(
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color.fromRGBO(73, 45, 37, 1.0)),
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded,
                                color: Color.fromRGBO(73, 45, 37, 1)),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontFamily: 'fredoka',
                                color: Color.fromRGBO(205, 188, 174, 1)),
                            contentPadding: EdgeInsets.all(20),
                            //para darle forma a simple vista
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(73, 45, 37, 1))),
                            //es para darle forma cuando le das click
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(73, 45, 37, 1)))),
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Forgot your password?',
                          style: GoogleFonts.fredoka(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(205, 188, 174, 1.0),
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Color.fromRGBO(205, 188, 174, 1.0)))),
                    ),
                  ),
                  SizedBox(
                      height:
                          20), // Añade un espacio entre el TextField y el botón
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF492D25),
                      padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 5), // Ajusta el ancho del botón
                    ),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.fredoka(
                          textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      )),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have an account? ',
                            style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(138, 107, 87, 1.0),
                            ))),
                        SizedBox(width: 3),
                        GestureDetector(
                          onTap: () {
                            // Aquí puedes agregar la navegación a la pantalla de login
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Register(title: "Register")),
                            );
                          },
                          child: Text('Create',
                              style: GoogleFonts.fredoka(
                                  textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(138, 107, 87, 1.0),
                              ))),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Color.fromRGBO(138, 107, 87, 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 2, left: 2),
                          child: Container(
                            child: Text('OR',
                                style: GoogleFonts.fredoka(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(205, 188, 174, 1.0),
                                ))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Color.fromRGBO(138, 107, 87, 1),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.facebook,
                          color: Color.fromRGBO(73, 45, 37, 1),
                          size: 50,
                        ),
                      ),
                      SizedBox(width: 25),
                      FaIcon(
                        FontAwesomeIcons.google,
                        size: 40,
                        color: Color.fromRGBO(73, 45, 37, 1),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
