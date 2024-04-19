import 'package:flutter/material.dart';
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
    _buildCarouselItem('Food \n Preferences', Icons.favorite),
    _buildCarouselItem('Option 3', Icons.lightbulb),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAF6F5),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 19.5),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 38.0,
              ),
              onPressed: () {
                // Aquí puedes implementar la lógica del menú
                print('Menú presionado');
              },
            ),
          ),
        ],
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
            margin: EdgeInsets.only(left: 20, bottom: 20), // Espacio entre el texto y la línea
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
              enableInfiniteScroll: false, // Deshabilitar desplazamiento infinito
              autoPlay: false, // Desactivar la reproducción automática
              aspectRatio: 16 / 9,
              viewportFraction: 0.6, // Porcentaje de la pantalla que ocupa cada elemento
              initialPage: _currentIndex,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // Actualizar el índice de la página actual
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
            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
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
        borderRadius: BorderRadius.circular(12.0),
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
            bottom: 8.0,
            right: 8.0,
            child: Text(
              text,
              style: GoogleFonts.fredoka(
                textStyle: TextStyle(
                  fontSize: 38.0,
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
