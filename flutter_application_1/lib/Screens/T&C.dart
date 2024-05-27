import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/Screens/Selection.dart';
import 'package:google_fonts/google_fonts.dart';

class Terminos extends StatelessWidget {
  int id;
  String condicion;
  Terminos({required this.condicion, required this.id});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xFFCDBCAE), // Establecer el color de fondo
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width *
                    0.1, // 10% del ancho de la pantalla
                vertical: MediaQuery.of(context).size.height *
                    0.07, // 3% de la altura de la pantalla
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'terms and Conditions ',
                    style: GoogleFonts.fredoka(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFf492D25),
                    ),
                  ),
                  Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu dui vivamus arcu felis bibendum ut tristique. At auctor urna nunc id cursus metus aliquam eleifend mi. Fermentum dui faucibus in ornare quam viverra. Nisl nunc mi ipsum faucibus. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies. Sit amet nisl suscipit adipiscing bibendum est ultricies integer quis. Tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce. Ornare arcu odio ut sem nulla pharetra diam sit. Sed arcu non odio euismod. Est ullamcorper eget nulla facilisi etiam dignissim. Sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Faucibus nisl tincidunt eget nullam non nisi est sit amet. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum. Odio tempor orci dapibus ultrices in. Morbi blandit cursus risus at ultrices mi tempus imperdiet. Fames ac turpis egestas integer eget aliquet nibh praesent tristique. Id venenatis a condimentum vitae sapien.
Convallis posuere morbi leo urna molestie at elementum. Viverra vitae congue eu consequat ac felis donec. Sed enim ut sem viverra aliquet eget sit. Turpis cursus in hac habitasse platea dictumst. ''',
                    style: GoogleFonts.fredoka(
                      fontSize: size.width * 0.032,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFf8A6B57),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            title: 'Home',
                            id: id,
                            condicion: condicion,
                            routines: dropdownExercise,
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
                'I have read and understand the T&C',
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
