import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyecto_tienda/crear_producto.dart';
import 'package:proyecto_tienda/pages/crear_cuenta.dart';
import 'package:proyecto_tienda/pages/editCateg.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:proyecto_tienda/pages/list_product.dart';
import 'package:proyecto_tienda/pages/listarUsuarios.dart';
import 'package:proyecto_tienda/pages/slider.dart';
import 'package:proyecto_tienda/pages/login.dart';
import 'package:proyecto_tienda/pages/powerPage.dart';
//import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/view_product.dart';

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      title: 'Mercado Libre',
      home: IntroScreen(),
      routes: <String, WidgetBuilder>{
        
         '/pages/slider': (BuildContext context) => new IntroScreen(),
        '/powerPage': (BuildContext context) => new SuperV(),
        '/pages/list_product': (BuildContext context) => new LisProduct(),
        '/pages/login': (BuildContext context) => new LoginPage(),
        '/pages/listarUsuarios': (BuildContext context) => new ListarUser(),
        '/pages/crear_cuenta': (BuildContext context) => new AddData(),
        '/pages/crear_producto': (BuildContext context) => new AdProductt(),
       '/pages/view_product': (BuildContext context) => new Gneralprudcut(),
       '/pages/listCateg':(BuildContext context) => new LisCatg(),
        '/editCateg':(BuildContext context) => new EditCateg(),

       
      },
    );
  }
}

