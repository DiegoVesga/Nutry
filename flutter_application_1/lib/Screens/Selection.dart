import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String dropdownValue = 'Yes';

class Selection extends StatefulWidget {
  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Selection> {
  // Variables para mantener el estado de los checkboxes

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Imagen de fondo
              Image.asset(
                'assets/home_2.jpeg',
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              ),
              // Contenedor para el texto y línea divisoria
              Positioned(
                top: size.height *
                    0.02, // Ajusta la posición vertical del contenido
                left: size.width *
                    0.05, // Ajusta la posición horizontal del contenido
                right: size.width * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Texto principal
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Text(
                        'Ingredient selection',
                        style: GoogleFonts.fredoka(
                          textStyle: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF492D25), // Color personalizado
                          ),
                        ),
                      ),
                    ),
                    // Línea divisoria
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.01,
                          left: size.width *
                              0.05), // Espacio entre el texto y la línea
                      height: 1, // Grosor de la línea
                      width: size.width * 0.9, // Longitud de la línea
                      color: Colors.black, // Color de la línea
                    ),
                    // Texto secundario
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Text(
                        'This information will help us adapt to your new healthy lifestyle.',
                        style: GoogleFonts.fredoka(
                          textStyle: TextStyle(
                            fontSize: size.width * 0.03,
                            color: Color(0xFF492D25), // Color personalizado
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Food Preferences',
                            style: GoogleFonts.fredoka(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.05,
                                color: Color(0xFF492D25), // Color personalizado
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Here you can choose the ingredients that you like the most.',
                              style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                                  fontSize: size.width * 0.03,
                                  color: Color(0xFF492D25), // Color personalizado
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 30,
                    ),

                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Color(0xffCDBCAE),
                              borderRadius: BorderRadius.circular(20),
                              
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 110, left: 110),
                            child: Text(
                              'DO YOU WANT TO KNOW WHAT EXERCISE ROUTINE YOU COULD DO?',
                              style: GoogleFonts.fredoka(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(73, 45, 37, 1),
                              ),
                              textAlign: TextAlign.center,
                              
                            ),
                          ),

                          SizedBox(height: 20),
                          
                          Container(
                            padding: EdgeInsets.all(size.height * 0.01),
                            height: 50,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color.fromRGBO(73, 45, 37, 1),
                                width: 2,
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: GoogleFonts.fredoka(
                                  color: Color.fromRGBO(73, 45, 37, 1)),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Yes',
                                'No'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),

                          SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Selection()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF492D25),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 5), // Ajusta el ancho del botón
                            ),
                            child: Text(
                              'Next',
                              style: GoogleFonts.fredoka(
                                  textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
