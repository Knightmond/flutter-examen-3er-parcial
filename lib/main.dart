import 'package:examen_3er_parcial/api/requests_api.dart';
import 'package:examen_3er_parcial/controllers/psychonaut_controller.dart';
import 'package:examen_3er_parcial/pages/detalles_psychonaut_page.dart';
import 'package:examen_3er_parcial/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => RequestsAPI());
  Get.lazyPut(() => PsychonautController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Examen 3er Parcial, JETO',
      routes: {
        '/': (context) => HomePage(),
        '/detalles/psychonaut': (context) => DetallesPsychonaut()
      },
    );
  }
}

