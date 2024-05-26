import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Selection.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

String dropdownValue = 'Diabetes';

class Userinfo extends StatefulWidget {
  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  //metodo para annadir la condicion medica al usuario logueado

  Future<void> addCondition() async {
    if (_yesChecked) {
      for (int i = 0; i < usersList.length; i++) {
        if (usersList[i]['user_id'] == 1) {
          if (dropdownValue == 'Diabetes') {
            usersList[i]['medical_condition'] = "Diabetes";
            print(usersList[i]['medical_condition']);
          } else {
            usersList[i]['medical_condition'] = "Obesidad";
            print(usersList[i]['medical_condition']);
          }
        }
      }
    } else {
      print('no hay condicion');
    }
  }

  // Variables para mantener el estado de los checkboxes
  bool _yesChecked = false;
  bool _noChecked = false;

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
                        'Do you have any medical condition?',
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
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Checkbox para "Yes"
                          Row(
                            children: [
                              Text(
                                'Yes',
                                style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                  color: Color(0xFF492D25),
                                ),
                              ),
                              SizedBox(
                                  width: size.width *
                                      0.02), // Espacio entre el texto y el checkbox
                              Theme(
                                data: ThemeData(
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: Checkbox(
                                  value: _yesChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _yesChecked = value!;
                                      if (_yesChecked) _noChecked = false;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      return _yesChecked
                                          ? Color(0xFF8A6B57)
                                          : Colors.transparent;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.1),
                          // Checkbox para "No"
                          Row(
                            children: [
                              Text(
                                'No',
                                style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                  color: Color(0xFF492D25),
                                ),
                              ),
                              SizedBox(
                                  width: size.width *
                                      0.02), // Espacio entre el texto y el checkbox
                              Theme(
                                data: ThemeData(
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: Checkbox(
                                  value: _noChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _noChecked = value!;
                                      if (_noChecked) _yesChecked = false;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      return _noChecked
                                          ? Color(0xFF8A6B57)
                                          : Colors.transparent;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8DED6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      width: double.infinity,
                      height: 500,
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color.fromRGBO(73, 45, 37, 1),
                                width: 3,
                              ),
                            ),
                            child: Icon(
                              Icons.personal_injury_outlined,
                              size: 80,
                              color: Color.fromRGBO(73, 45, 37, 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Medical Condition',
                              style: GoogleFonts.fredoka(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(73, 45, 37, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            padding: EdgeInsets.all(size.height * 0.01),
                            height: 50,
                            width: 300,
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
                                'Diabetes',
                                'Obesidad'
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
                              addCondition();
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
