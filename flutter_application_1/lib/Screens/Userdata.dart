import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/Screens/UserInfo.dart';
import 'package:flutter_application_1/Services/shared_prefs.dart';
import 'package:flutter_application_1/main.dart';

import 'package:google_fonts/google_fonts.dart';

class Userdata extends StatefulWidget {
  final String title;

  const Userdata({super.key, required this.title});

  @override
  State<Userdata> createState() => _UserdataState();
}

class _UserdataState extends State<Userdata> {
  int selectedDay = 1;
  String dropdownValue = 'January';
  String selectedYear = '2004';
  String dropdownGender = 'Male';
  String dropdownWeight = 'Kg';
  String dropdownHeight = 'cm';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<int> days = List<int>.generate(31, (index) => index + 1);
    List<String> years =
        List.generate(2025 - 1924, (index) => (1924 + index).toString());

    return SafeArea(
      child: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            'assets/Inicio.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top:
                size.height * 0.02, // Ajusta la posición vertical del contenido
            left: size.width *
                0.05, // Ajusta la posición horizontal del contenido
            right: size.width * 0.05,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01),
                  child: Text(
                    'Tell us about your current situation',
                    style: GoogleFonts.fredoka(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.048,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF492D25), // Color personalizado
                      ),
                    ),
                  ),
                ),
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
                        fontSize: size.width * 0.025,
                        color: Color(0xFF492D25), // Color personalizado
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01),
                  child: Text(
                    'Birth`s date',
                    style: GoogleFonts.fredoka(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF492D25), // Color personalizado
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(73, 45, 37, 1),
                          width: 2,
                        ),
                      ),
                      child: DropdownButton<int>(
                        value: selectedDay,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: GoogleFonts.fredoka(
                            color: Color.fromRGBO(73, 45, 37, 1)),
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedDay = newValue!;
                          });
                        },
                        items: days.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 150,
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
                        onChanged: (String? newValue1) {
                          setState(() {
                            dropdownValue = newValue1!;
                          });
                        },
                        items: <String>[
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'Jun',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
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
                        value: selectedYear,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: GoogleFonts.fredoka(
                            color: Color.fromRGBO(73, 45, 37, 1)),
                        onChanged: (String? newValue1) {
                          setState(() {
                            selectedYear = newValue1!;
                          });
                        },
                        items:
                            years.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Gender',
                          style: GoogleFonts.fredoka(
                            textStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF492D25), // Color personalizado
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(73, 45, 37, 1),
                          width: 2,
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownGender,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: GoogleFonts.fredoka(
                            color: Color.fromRGBO(73, 45, 37, 1)),
                        onChanged: (String? newValue1) {
                          setState(() {
                            dropdownGender = newValue1!;
                          });
                        },
                        items: <String>[
                          'Male',
                          'Female',
                          'Another',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Weight',
                          style: GoogleFonts.fredoka(
                            textStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF492D25), // Color personalizado
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(73, 45, 37, 1),
                          width: 2,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(73, 45, 37, 1)),
                        )),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(73, 45, 37, 1),
                          width: 2,
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownWeight,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: GoogleFonts.fredoka(
                            color: Color.fromRGBO(73, 45, 37, 1)),
                        onChanged: (String? newValue1) {
                          setState(() {
                            dropdownWeight = newValue1!;
                          });
                        },
                        items: <String>[
                          'Kg',
                          'Lb',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Height',
                          style: GoogleFonts.fredoka(
                            textStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF492D25), // Color personalizado
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(73, 45, 37, 1),
                          width: 2,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(73, 45, 37, 1)),
                        )),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(size.height * 0.01),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(73, 45, 37, 1),
                          width: 2,
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownHeight,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: GoogleFonts.fredoka(
                            color: Color.fromRGBO(73, 45, 37, 1)),
                        onChanged: (String? newValue1) {
                          setState(() {
                            dropdownHeight = newValue1!;
                          });
                        },
                        items: <String>[
                          'cm',
                          'm',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40,left: 30),
                      child: Image.asset(
                        'assets/Nutryologa.png',
                        height: 220,
                      ),
                    ),
                    ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Userinfo(),
                      ),
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
                )
                  ],
                ),

                
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
