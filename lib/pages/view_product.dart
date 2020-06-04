import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/addCateg.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:proyecto_tienda/pages/list_product.dart';


class Gneralprudcut extends StatelessWidget {
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
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/pages/login', (Route<dynamic> route) => false);
            },
          ),
          VerticalDivider(),
          new RaisedButton(
            child:
                new Text("No", style: new TextStyle(color: Colors.white)),
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
          title: Center(child: Text( 'Administracion-Productos',textAlign: TextAlign.center,),),
        
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40.0,
                  color: Colors.red,
                ),
                  onPressed: () => confirm(),
               )
          ],
        ),
        body: Container(
           decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.redAccent,Colors.tealAccent])),
          child: ListView(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(70.0),
            ),
            new RaisedButton(
            
              child: new Text(' Productos Registrados',style: titulo,),
              color: Colors.black,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(0)),
              onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/pages/list_product', (Route<dynamic> route) => false);

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
      ),
    );
  }
 
}
 