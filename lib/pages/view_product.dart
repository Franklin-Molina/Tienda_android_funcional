 import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/addCateg.dart';
import 'package:proyecto_tienda/pages/crear_cuenta.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:proyecto_tienda/pages/list_product.dart';
import 'package:proyecto_tienda/pages/listarUsuarios.dart';

class Gneralprudcut extends StatelessWidget {
  final titulo = TextStyle(color: Colors.white, fontSize: 15.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Administracion-Productos'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40.0,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/LoginPage');
                })
          ],
        ),
        body: ListView(children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(70.0),
          ),
          new RaisedButton(
          
            child: new Text(' Productos Registrados',style: titulo,),
            color: Colors.black,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0)),
            onPressed: () {
    
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LisProduct()));
            },
          ),
           Divider(),
          new RaisedButton(
            child: new Text(' Crear Producto '),
            color: Colors.orange,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0)),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddProduct()));
            },
          ),
          Divider(),
          new RaisedButton(
            child: new Text('Categorias Registradas'),
            color: Colors.tealAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0)),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LisCatg()));
            },
          ), 
         
          Divider(),
          new RaisedButton(
            child: new Text(' Agregar  Categoria '),
            color: Colors.lightGreenAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0)),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddCatg()));
            },
          ),
        ]),
      ),
    );
  }
 
}
 