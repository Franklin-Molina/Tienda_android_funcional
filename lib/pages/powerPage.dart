import 'package:flutter/material.dart';
import 'package:proyecto_tienda/crear_producto.dart';
import 'package:proyecto_tienda/pages/addCateg.dart';
import 'package:proyecto_tienda/pages/crear_cuenta.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:proyecto_tienda/pages/list_product.dart';
import 'package:proyecto_tienda/pages/listarUsuarios.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class SuperV extends StatelessWidget {
  final titulo = TextStyle(color: Colors.white, fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    void confirm() {
      AlertDialog alertDialog = new AlertDialog(
        content: new Text("¿Esta seguro de Salir?"),
        actions: <Widget>[
          new RaisedButton(
            child: new Text(
              " Si",
              style: new TextStyle(color: Colors.black),
            ),
            color: Colors.red,
             onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/pages/slider', (Route<dynamic> route) => false);
            },
          ),
          VerticalDivider(),
          new RaisedButton(
            child: new Text("No", style: new TextStyle(color: Colors.black)),
            color: Colors.green,
            onPressed: () => Navigator.pop(context),
           
          ),
         
        ],
      );

      showDialog(
          context: context, barrierDismissible: false, child: alertDialog);
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text('Administracion', textAlign: TextAlign.center)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                size: 40.0,
                color: Colors.red,
              ),
              //Exi
              onPressed: () => confirm(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.red, Colors.white])),
          child: ListView(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text(
                ' Productos Registrados',
                style: titulo,
              ),
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
                    builder: (BuildContext context) => new AdProductt()));
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
            Divider(),
            new RaisedButton(
              child: new Text('Categorias Registradas  '),
              color: Colors.redAccent,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0)),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new LisCatg()));
              },
            ),
            Divider(),
            new RaisedButton(
              child: new Text(' Crear Categorias '),
              color: Colors.blueAccent,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0)),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new AddCatg()));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
