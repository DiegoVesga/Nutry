import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  final String title;
  const Login({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Image.asset('assets/Inicio.jpeg',
              fit: BoxFit.cover,
              ),
              )
            
          ],
          ),
        

      ),
    );
  }
}