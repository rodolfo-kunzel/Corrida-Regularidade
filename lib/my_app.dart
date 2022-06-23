import 'package:corrida_de_regulariodade_flutter/features/home_page/home_view.dart';
import 'package:flutter/material.dart';

import 'features/car_register_page/view/car_register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: CarRegisterView(),
    );
  }
}