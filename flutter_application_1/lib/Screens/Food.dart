import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
