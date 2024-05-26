import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Routines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                            "assets/Ejercicio.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    'Examples',
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
                          'Caminar: ',
                          style: GoogleFonts.fredoka(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFf492D25),
                          ),
                        ),
                        Text(
                          '''* Descripción: Es una actividad de bajo impacto que puede realizarse a diferentes intensidades.
* Beneficios: Mejora la circulación, ayuda a controlar el nivel de glucosa en sangre y es fácil de incorporar en la rutina diaria.
* Recomendaciones: Caminar al menos 30 minutos al día, cinco veces a la semana''',
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
                          'Entrenamiento de Fuerza: ',
                          style: GoogleFonts.fredoka(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFf492D25),
                          ),
                        ),
                        Text(
                          '''* Descripción: Involucra el uso de pesas, bandas de resistencia o el peso corporal para fortalecer los músculos.
* Beneficios: Ayuda a aumentar la masa muscular, mejora la sensibilidad a la insulina y fortalece los huesos.
* Recomendaciones: Realizar ejercicios de fuerza dos a tres veces por semana, trabajando todos los grupos musculares principales.''',
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
                          'Yoga: ',
                          style: GoogleFonts.fredoka(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFf492D25),
                          ),
                        ),
                        Text(
                          '''* Descripción: Combinación de posturas, respiración y meditación.
* Beneficios: Reduce el estrés, mejora la flexibilidad y el equilibrio, y puede ayudar a reducir los niveles de glucosa en sangre.
* Recomendaciones: Practicar yoga dos a tres veces por semana, con clases adaptadas al nivel de cada persona.''',
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
      ),
    );
  }
}
