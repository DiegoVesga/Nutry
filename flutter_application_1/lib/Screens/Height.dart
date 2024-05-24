import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';

class Height extends StatelessWidget {
  int id;
  final String title;
  Height({required this.id, Key? key, required this.title}) : super(key: key);
  TextEditingController heightController = TextEditingController();

  Future<void> addHeight() async {
    for (int i = 0; i < usersList.length; i++) {
      if (id == usersList[i]['user_id']) {
        //deben colocar una comprobacion al textfield para solo colocar numeros y que el teclado sea numerico
        int height = int.parse(heightController.text);
        usersList[i]['height'] = height;
        print('todo el usuario: ${usersList[i]}');
      }
    }
  }

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
            // Contenedor para el texto y línea divisoria
            Positioned(
              top: 60, // Ajusta la posición vertical del contenido
              left: 0, // Ajusta la posición horizontal del contenido
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto principal
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      'Tell us about your current situation',
                      style: GoogleFonts.fredoka(
                        textStyle: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF492D25), // Color personalizado
                        ),
                      ),
                    ),
                  ),
                  // Línea divisoria
                  Container(
                    margin: EdgeInsets.only(
                        top: 2, left: 8), // Espacio entre el texto y la línea
                    height: 1, // Grosor de la línea
                    width: 350, // Longitud de la línea
                    color: Colors.black, // Color de la línea
                  ),
                  // Texto secundario
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      'This information will help us adapt to your new healthy lifestyle.',
                      style: GoogleFonts.fredoka(
                        textStyle: const TextStyle(
                          fontSize: 11.3,
                          color: Color(0xFF492D25), // Color personalizado
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Center para colocar la imagen en el centro de la pantalla
            Positioned(
              top: 220, // Ajusta la posición vertical de la imagen
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 140,
                  height: 160,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/height.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Texto centrado debajo de la imagen
            Positioned(
              top: 450, // Ajusta la posición vertical del texto
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Body height',
                  style: GoogleFonts.fredoka(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            // Fila con ComboBox debajo del texto
            Positioned(
              top: 520, // Ajusta la posición vertical de la fila
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ComboBox para el mes
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFF492D25), // Color del borde
                        ),
                        color: Color(0xFFE8DED6), // Color de relleno
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Height', // Texto por defecto del TextField
                          border:
                              InputBorder.none, // Oculta el borde por defecto
                          contentPadding: EdgeInsets
                              .zero, // Elimina el espacio interno por defecto
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFF492D25), // Color del borde
                        ),
                        color: Color(0xFFE8DED6), // Color de relleno
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButton<String>(
                        value:
                            'Cm', // Valor seleccionado (puedes cambiar esto según tus necesidades)
                        onChanged: (value) {
                          // Implementa la lógica cuando se selecciona un valor
                        },
                        underline:
                            Container(), // Para ocultar la línea por defecto del DropdownButton
                        items: ['Cm', 'In'].map((height) {
                          return DropdownMenuItem(
                            value: height,
                            child: Text(height),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Botón "Next" debajo de los ComboBox
            Positioned(
              top: 605, // Ajusta la posición vertical del botón
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF492D25), // Color de fondo del botón
                  ),
                  child: TextButton(
                    onPressed: () {
                      addHeight();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(title: "Login")),
                      );
                    },
                    child: Text(
                      'Finish',
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
            ),
          ],
        ),
      ),
    );
  }
}
