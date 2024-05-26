import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

String dropdownValue = 'Yes';

class Selection extends StatefulWidget {
  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Selection> {
  // Lista de nombres de los alimentos
  final List<String> _foodOptions = [
    'Pollo',
    'Champiñones',
    'Salmón',
    'Zanahoria',
    'Pavo',
    'Aguacate',
    'Lenteja',
    'Garbanzo',
    'Tofu'
  ];

  // Estado de los checkboxes
  List<bool> _checked = List.generate(9, (index) => false);

  Map<String, dynamic> selectedPreferences = {};

  Future<void> setFoodPreferences() async {
    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i]['user_id'] == 1 &&
          usersList[i]['medical_condition'] == 'Diabetes') {
        if (_checked[0]) {
          selectedPreferences['Pollo'] = {
            "Recetas": {
              "Pollo a la parrilla con espárragos y champiñones": {
                "Proteina": "Pollo",
                "Ingredientes":
                    "Pechuga de pollo, espárragos, champiñones, aceite de oliva, ajo, sal, pimienta",
                "Preparación":
                    "Sazona la pechuga de pollo con sal y pimienta\nCocina a la parrilla hasta que esté bien cocida\nEn una sartén, saltea los espárragos y los champiñones con un poco de aceite de oliva y ajo picado\nSirve el pollo acompañado de los espárragos y champiñones"
              },
              "Sopa de vegetales y pollo": {
                "Proteina": "Pollo",
                "Ingredientes":
                    "Pechuga de pollo desmenuzada, zanahorias, apio, cebolla, calabacín, espinacas, caldo de pollo bajo en sodio, ajo, perejil",
                "Preparación":
                    "Cocina las verduras picadas en el caldo de pollo junto con el ajo hasta que estén tiernas\nAñade el pollo desmenuzado y las espinacas\nCocina unos minutos más, ajusta de sal y espolvorea con perejil antes de servir"
              }
            }
          };
        } else {
          selectedPreferences.remove('Pollo');
        }
        if (_checked[1]) {
          selectedPreferences['Champinnones'] = {
            "Recetas": {
              "Tofu Salteado con Vegetales y Arroz Integral": {
                "Proteina": "Tofu",
                "Ingredientes":
                    "Tofu firme, brócoli, zanahorias, champiñones, cebolla, ajo, salsa de soja baja en sodio, aceite de sésamo, jengibre fresco, arroz integral cocido",
                "Preparación":
                    "Saltea el tofu cortado en cubos con vegetales y aromáticos en una sartén con aceite de sésamo y salsa de soja\nSirve sobre arroz integral cocido"
              }
            }
          };
        } else {
          selectedPreferences.remove('Champinnones');
        }
        if (_checked[2]) {
          selectedPreferences['Salmon'] = {
            "Recetas": {
              "Salmon al horno con vegetales": {
                "Proteina": "Salmon",
                "Ingredientes":
                    "Filete de salmón, brócoli, zanahorias, calabacín, aceite de oliva, limón, eneldo, sal",
                "Preparación":
                    "Precalienta el horno a 180°C\nColoca el salmón en una bandeja para hornear, sazona con sal, eneldo y jugo de limón\nAñade los vegetales alrededor del salmón, rocía con un poco de aceite de oliva\nHornea durante 20-25 minutos hasta que el salmón esté cocido y los vegetales tiernos"
              }
            }
          };
        } else {
          selectedPreferences.remove('Salmon');
        }
        if (_checked[3]) {
          selectedPreferences['Zanahoria'] = {
            "Recetas": {
              "Tofu Salteado con Vegetales y Arroz Integral": {
                "Proteina": "Tofu",
                "Ingredientes":
                    "Tofu firme, brócoli, zanahorias, champiñones, cebolla, ajo, salsa de soja baja en sodio, aceite de sésamo, jengibre fresco, arroz integral cocido",
                "Preparación":
                    "Saltea el tofu cortado en cubos con vegetales y aromáticos en una sartén con aceite de sésamo y salsa de soja\nSirve sobre arroz integral cocido"
              }
            }
          };
        } else {
          selectedPreferences.remove('Zanahoria');
        }
        if (_checked[4]) {
          selectedPreferences['Pavo'] = {
            "Recetas": {
              "Hamburguesas de Pavo con Ensalada de Espinacas y Fresas": {
                "Proteina": "Pavo",
                "Ingredientes":
                    "Carne molida de pavo, espinacas frescas, fresas, cebolla roja, vinagre balsámico, aceite de oliva, sal, pimienta",
                "Preparación":
                    "Prepara hamburguesas de pavo sazonadas con ajo picado, cebolla picada, sal y pimienta\nAsa a la parrilla y sirve sobre una cama de espinacas frescas y fresas, aliñadas con vinagreta balsámica"
              }
            }
          };
        } else {
          selectedPreferences.remove('Pavo');
        }
        if (_checked[5]) {
          selectedPreferences['Aguacate'] = {
            "Recetas": {
              "Ensalada de Lentejas con Aguacate y Tomate": {
                "Proteina": "Lentejas",
                "Ingredientes":
                    "Lentejas cocidas, aguacate, tomate, cebolla roja, cilantro fresco, aceite de oliva, jugo de limón, sal, pimienta",
                "Preparación":
                    "Mezcla las lentejas cocidas con aguacate, tomate, cebolla roja y cilantro fresco\nAliña con aceite de oliva, jugo de limón, sal y pimienta"
              }
            }
          };
        } else {
          selectedPreferences.remove('Aguacate');
        }
        if (_checked[6]) {
          selectedPreferences['Lentejas'] = {
            "Recetas": {
              "Ensalada de lentejas con aguacate y tomate": {
                "Proteina": "Lentejas",
                "Ingredientes":
                    "Lentejas cocidas, aguacate, tomate, cebolla roja, perejil, aceite de oliva, vinagre balsámico, sal",
                "Preparación":
                    "Mezcla las lentejas cocidas con aguacate en cubos, tomate picado y cebolla roja en rodajas\nAliña con aceite de oliva, vinagre balsámico y sal\nEspolvorea perejil picado antes de servir"
              }
            }
          };
        } else {
          selectedPreferences.remove('Lentejas');
        }
        if (_checked[7]) {
          selectedPreferences['Garbanzos'] = {
            "Recetas": {
              "Tiras de Pollo a la Parrilla con Ensalada de Garbanzos": {
                "Proteina": "Pollo",
                "Ingredientes":
                    "Pechuga de pollo en tiras, garbanzos cocidos, tomate cherry, pepino, cebolla roja, vinagre balsámico, aceite de oliva, perejil, sal, pimienta",
                "Preparación":
                    "Marinar las tiras de pollo con aceite de oliva, ajo picado, jugo de limón, sal y pimienta\nAsar a la parrilla y servir con una ensalada de garbanzos y vegetales frescos"
              }
            }
          };
        } else {
          selectedPreferences.remove('Garbanzos');
        }
        if (_checked[8]) {
          selectedPreferences['Tofu'] = {
            "Recetas": {
              "Tofu Salteado con Vegetales y Arroz Integral": {
                "Proteina": "Tofu",
                "Ingredientes":
                    "Tofu firme, brócoli, zanahorias, champiñones, cebolla, ajo, salsa de soja baja en sodio, aceite de sésamo, jengibre fresco, arroz integral cocido",
                "Preparación":
                    "Saltea el tofu cortado en cubos con vegetales y aromáticos en una sartén con aceite de sésamo y salsa de soja\nSirve sobre arroz integral cocido"
              }
            }
          };
        } else {
          selectedPreferences.remove('Tofu');
        }
        usersList[i]['food_preferences']['food_like'] = selectedPreferences;
        //'_Map<String, Map<String, Map<String, Map<String, String>>>>' is not a subtype of type 'Map<String, Map<String, Map<String, Map<String, Map<String, String>>>>>' of 'value'
        print(usersList[i]['food_preferences']['food_like']);
      }
      //obesos
      if (usersList[i]['user_id'] == 1 &&
          usersList[i]['medical_condition'] == 'Obesidad') {
        if (_checked[0]) {
          selectedPreferences['Pollo'] = {
            "Recetas": {
              "Pollo al Horno con Espárragos y Quinoa": {
                "Proteina": "Pollo",
                "Ingredientes":
                    "Pechuga de pollo, espárragos, quinoa cocida, aceite de oliva, ajo, limón, sal, pimienta",
                "Preparación":
                    "Sazona la pechuga de pollo con sal y pimienta\nCocina a la parrilla hasta que esté bien cocida\nEn una sartén, saltea los espárragos y los champiñones con un poco de aceite de oliva y ajo picado\nSirve el pollo acompañado de los espárragos y champiñones, agrega quinoa cocida como guarnición"
              }
            }
          };
        } else {
          selectedPreferences.remove('Pollo');
        }
        if (_checked[1]) {
          selectedPreferences['Champinnones'] = {
            "Recetas": {
              "Tofu Salteado con Vegetales y Arroz Integral": {
                "Proteina": "Tofu",
                "Ingredientes":
                    "Tofu firme, brócoli, zanahorias, champiñones, cebolla, ajo, salsa de soja baja en sodio, aceite de sésamo, jengibre fresco, arroz integral cocido",
                "Preparación":
                    "Saltea el tofu cortado en cubos con vegetales y aromáticos en una sartén con aceite de sésamo y salsa de soja\nSirve sobre arroz integral cocido"
              }
            }
          };
        } else {
          selectedPreferences.remove('Champinnones');
        }
        if (_checked[2]) {
          selectedPreferences['Salmon'] = {
            "Recetas": {
              "Salmón al Horno con Espárragos y Quinoa": {
                "Proteina": "Salmon",
                "Ingredientes":
                    "Filete de salmón, espárragos, quinoa cocida, aceite de oliva, ajo, limón, sal, pimienta",
                "Preparación":
                    "Precalienta el horno a 180°C\nColoca el salmón en una bandeja para hornear, sazona con sal, eneldo y jugo de limón\nAñade los vegetales alrededor del salmón, rocía con un poco de aceite de oliva\nHornea durante 20-25 minutos hasta que el salmón esté cocido y los vegetales tiernos, agrega quinoa cocida como guarnición"
              }
            }
          };
        } else {
          selectedPreferences.remove('Salmon');
        }
        if (_checked[3]) {
          selectedPreferences['Zanahoria'] = {
            "Recetas": {
              "Tofu Salteado con Vegetales y Arroz Integral": {
                "Proteina": "Tofu",
                "Ingredientes":
                    "Tofu firme, brócoli, zanahorias, champiñones, cebolla, ajo, salsa de soja baja en sodio, aceite de sésamo, jengibre fresco, arroz integral cocido",
                "Preparación":
                    "Saltea el tofu cortado en cubos con vegetales y aromáticos en una sartén con aceite de sésamo y salsa de soja\nSirve sobre arroz integral cocido"
              }
            }
          };
        } else {
          selectedPreferences.remove('Zanahoria');
        }
        if (_checked[4]) {
          selectedPreferences['Pavo'] = {
            "Recetas": {
              "Hamburguesas de Pavo con Ensalada de Espinacas y Fresas": {
                "Proteina": "Pavo",
                "Ingredientes":
                    "Carne molida de pavo, espinacas frescas, fresas, cebolla roja, vinagre balsámico, aceite de oliva, sal, pimienta",
                "Preparación":
                    "Prepara hamburguesas de pavo sazonadas con ajo picado, cebolla picada, sal y pimienta\nAsa a la parrilla y sirve sobre una cama de espinacas frescas y fresas, aliñadas con vinagreta balsámica"
              }
            }
          };
        } else {
          selectedPreferences.remove('Pavo');
        }
        if (_checked[5]) {
          selectedPreferences['Aguacate'] = {
            "Recetas": {
              "Ensalada de Garbanzos con Aguacate y Tomate": {
                "Proteina": "Garbanzos",
                "Ingredientes":
                    "Garbanzos cocidos, aguacate, tomate, cebolla roja, cilantro fresco, aceite de oliva, jugo de limón, sal, pimienta",
                "Preparación":
                    "Mezcla los garbanzos cocidos con aguacate en cubos, tomate picado y cebolla roja en rodajas\nAliña con aceite de oliva, vinagre balsámico y sal\nEspolvorea perejil picado antes de servir"
              }
            }
          };
        } else {
          selectedPreferences.remove('Aguacate');
        }
        if (_checked[6]) {
          selectedPreferences['Lentejas'] = {
            "Recetas": {
              "Ensalada de Garbanzos con Aguacate y Tomate": {
                "Proteina": "Garbanzos",
                "Ingredientes":
                    "Garbanzos cocidos, Aguacate, Tomate, Cebolla roja, Cilantro fresco,Aceite de oliva, Jugo de limón, Sal, Pimienta",
                "Preparación":
                    "Sigue las instrucciones para la ensalada de lentejas con aguacate y tomate, utilizando garbanzos cocidos en lugar de lentejas."
              }
            }
          };
        } else {
          selectedPreferences.remove('Lentejas');
        }
        if (_checked[7]) {
          selectedPreferences['Garbanzos'] = {
            "Recetas": {
              "Ensalada de Garbanzos con Aguacate y Tomate": {
                "Proteina": "Garbanzos",
                "Ingredientes":
                    "Garbanzos cocidos, aguacate, tomate, cebolla roja, cilantro fresco, aceite de oliva, jugo de limón, sal, pimienta",
                "Preparación":
                    "Mezcla los garbanzos cocidos con aguacate en cubos, tomate picado y cebolla roja en rodajas\nAliña con aceite de oliva, vinagre balsámico y sal\nEspolvorea perejil picado antes de servir"
              }
            }
          };
        } else {
          selectedPreferences.remove('Garbanzos');
        }
        if (_checked[8]) {
          selectedPreferences['Tofu'] = {
            "Recetas": {
              "Tofu Salteado con Vegetales y Arroz Integral": {
                "Proteina": "Tofu",
                "Ingredientes":
                    "Tofu firme, brócoli, zanahorias, champiñones, cebolla, ajo, salsa de soja baja en sodio, aceite de sésamo, jengibre fresco, arroz integral cocido",
                "Preparación":
                    "Saltea el tofu cortado en cubos con vegetales y aromáticos en una sartén con aceite de sésamo y salsa de soja\nSirve sobre arroz integral cocido"
              }
            }
          };
        } else {
          selectedPreferences.remove('Tofu');
        }
        usersList[i]['food_preferences']['food_like'] = selectedPreferences;
        //'_Map<String, Map<String, Map<String, Map<String, String>>>>' is not a subtype of type 'Map<String, Map<String, Map<String, Map<String, Map<String, String>>>>>' of 'value'
        print(usersList[i]['food_preferences']['food_like']);
      }
    }
  }

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
                    SizedBox(height: size.height * 0.03),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Text(
                              'Here you can choose the ingredients that you like the most.',
                              style: GoogleFonts.fredoka(
                                textStyle: TextStyle(
                                  fontSize: size.width * 0.03,
                                  color:
                                      Color(0xFF492D25), // Color personalizado
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xffCDBCAE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(size.width * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  Like:',
                                    style: GoogleFonts.fredoka(
                                      textStyle: TextStyle(
                                        fontSize: size.width * 0.04,
                                        color: Color(
                                            0xFF492D25), // Color personalizado
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Wrap(
                                    spacing: size.width * 0.001,
                                    runSpacing: size.height * 0.0001,
                                    children: List.generate(_foodOptions.length, (index) {
                                      return Container(
                                        width: (size.width * 0.9 - 75) /
                                            2, // Ancho para que se ajusten 2 columnas
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: _checked[index],
                                              activeColor: Color(
                                                  0xFF3B0000), // Color cuando se selecciona
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  _checked[index] = value!;
                                                });
                                                print(
                                                    'checkbox position: ${_checked.indexed}');
                                                setFoodPreferences();
                                              },
                                            ),
                                            Expanded(
                                              child: Text(
                                                _foodOptions[index],
                                                style: GoogleFonts.fredoka(
                                                  textStyle: TextStyle(
                                                    fontSize: size.width * 0.03,
                                                    color: Color(0xFF492D25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.2),
                            child: Text(
                              'DO YOU WANT TO KNOW\nWHAT EXERCISE ROUTINE\nYOU COULD DO?',
                              style: GoogleFonts.fredoka(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(73, 45, 37, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                            padding: EdgeInsets.all(size.height * 0.01),
                            height: size.height * 0.05,
                            width: size.width * 0.2,
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
                          SizedBox(height: size.height * 0.04),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                          title: 'Home',
                                          id: 1,
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF492D25),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.1,
                                  vertical: size.height *
                                      0.01), // Ajusta el ancho del botón
                            ),
                            child: Text(
                              'Next',
                              style: GoogleFonts.fredoka(
                                  textStyle: TextStyle(
                                fontSize: size.width * 0.045,
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
