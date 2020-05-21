import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/crear_cuenta.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/list_product.dart';
import 'package:proyecto_tienda/pages/listarUsuarios.dart';

class SuperV extends StatelessWidget {
  final titulo = TextStyle(color: Colors.black, fontSize: 15.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin All'),
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
            child: new Text(' Productos Registrados'),
            color: Colors.tealAccent,
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
            child: new Text('Usuarios Registrados'),
            color: Colors.tealAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0)),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ListarUser()));
            },
          ),
         
          Divider(),
          new RaisedButton(
            child: new Text(' Crear Usuarios '),
            color: Colors.lightGreenAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0)),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddData()));
            },
          ),
        ]),
      ),
    );
  }
}
