import 'package:facebook2/telas/principal.dart';
import 'package:facebook2/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: PaletaCores.scaffold
    ),
    //home: Home(),
    home: Principal(),
  ));
}
