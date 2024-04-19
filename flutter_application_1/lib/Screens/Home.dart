import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedButton = ''; // Estado para rastrear el botón seleccionado
  int _currentIndex = 0; // Índice de la página actual en el CarouselSlider

  // Listas de elementos para cada tipo de contenido en el CarouselSlider
  List<Widget> _detailsCarouselItems = [
    _buildCarouselItem('Details 1', Icons.star),
    _buildCarouselItem('BMI', Icons.speed),
    _buildCarouselItem('Details 3', Icons.music_note),
  ];

  List<Widget> _dailyGoalsCarouselItems = [
    _buildCarouselItem('Goal 1', Icons.directions_run),
    _buildCarouselItem('Daily Diet', Icons.restaurant),
    _buildCarouselItem('Goal 3', Icons.local_cafe),
  ];

  List<Widget> _optionsCarouselItems = [
    _buildCarouselItem('Option 1', Icons.settings),
    _buildCarouselItem('              Food \n Preferences', Icons.favorite),
    _buildCarouselItem('Option 3', Icons.lightbulb),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAF6F5),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                size: 45,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Abre el Drawer
              },
            ),
          ),
        ],
      ),
      endDrawer: Container(
        width: 250,
        child: Drawer(
          backgroundColor: Color.fromRGBO(206, 193, 184, 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 110,
                        color: Color.fromRGBO(73, 45, 37, 1),
                      ),
                      Text(
                        'William Insignares',
                        style: GoogleFonts.fredoka(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF492D25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: Container(
                          height: 40,
                          width: 150,
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
                                    builder: (context) =>
                                        Login(title: "Aqui va settings")),
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
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 40,
                          width: 150,
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
                                    builder: (context) =>
                                        Login(title: "Login")),
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
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          height: 0.5, // Grosor de la línea
                          width: 160, // Longitud de la línea
                          color: Color(0xFF492D25), // Color de la línea
                        ),
                      ),

                      Image.asset(
                        "assets/Nutry.jpeg"
                      ),
                    ],
                  ),
                ),
              ),
              // Agrega más elementos del Drawer aquí según sea necesario
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAF6F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Primer Columna
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icono de persona con línea de división
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(
                    Icons.person_outline,
                    size: 120.0,
                    color: Color(0xFF492d25),
                  ),
                ),
              ),
              SizedBox(width: 16.0), // Espacio entre el icono y los textos

              // Columna de textos
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: GoogleFonts.fredoka(
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF492D25),
                        ),
                      ),
                    ),
                    Text(
                      'User Name',
                      style: GoogleFonts.fredoka(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF492D25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Segunda Columna (Divider)
          Container(
            margin: EdgeInsets.only(
                left: 20, bottom: 20), // Espacio entre el texto y la línea
            height: 1, // Grosor de la línea
            width: 350, // Longitud de la línea
            color: Colors.black, // Color de la línea
          ),

          // Tercer Columna (Row con botones)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('Details'),
              SizedBox(width: 20),
              _buildButton('Daily Goals'),
              SizedBox(width: 20),
              _buildButton('Options'),
            ],
          ),

          SizedBox(height: 30), // Espacio adicional hacia abajo

          // Cuarta Columna (Carousel Slider)
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              enableInfiniteScroll:
                  false, // Deshabilitar desplazamiento infinito
              autoPlay: false, // Desactivar la reproducción automática
              aspectRatio: 16 / 9,
              viewportFraction:
                  0.6, // Porcentaje de la pantalla que ocupa cada elemento
              initialPage: _currentIndex,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex =
                      index; // Actualizar el índice de la página actual
                });
              },
            ),
            items: _getCarouselItems(),
          ),
        ],
      ),
    );
  }

  List<Widget> _getCarouselItems() {
    // Retorna la lista de elementos según el botón seleccionado
    switch (selectedButton) {
      case 'Details':
        return _detailsCarouselItems;
      case 'Daily Goals':
        return _dailyGoalsCarouselItems;
      case 'Options':
        return _optionsCarouselItems;
      default:
        return _detailsCarouselItems; // Mostrar por defecto los detalles si no se ha seleccionado nada
    }
  }

  Widget _buildButton(String buttonText) {
    bool isSelected = selectedButton == buttonText;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = isSelected ? '' : buttonText; // Alternar selección
        });
      },
      child: Text(
        buttonText,
        style: GoogleFonts.fredoka(
          textStyle: TextStyle(
            fontSize: 18,
            color: Color(0xFF492D25),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration:
                isSelected ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }

  static Widget _buildCarouselItem(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF8a6b57),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 15.0,
            right: 15.0,
            child: Text(
              text,
              style: GoogleFonts.fredoka(
                textStyle: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFe8ded6),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Icon(
              icon,
              size: 70.0,
              color: Color(0xFFe8ded6),
            ),
          ),
        ],
      ),
    );
  }
}
