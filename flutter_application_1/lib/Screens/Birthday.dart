import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Birthday extends StatelessWidget {
  final String title;
  const Birthday({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Imagen de fondo
            Image.asset(
              'assets/home_2.jpeg',
              fit: BoxFit.cover,
            ),
            // Contenedor para el texto sobre la imagen
            Positioned(
              top: 50, // Ajusta la posición vertical del texto
              left: 0, // Ajusta la posición horizontal del texto
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: BoxDecoration(
                ),
                child: Text(
                  'Tell us about your current situation',
                  style: GoogleFonts.fredoka(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF492D25), // Color personalizado
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
