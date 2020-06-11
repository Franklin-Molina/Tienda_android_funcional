/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/allproduct/Clase.dart';
import 'package:proyecto_tienda/allproduct/detalles.dart';

class Delett extends StatefulWidget {

  final List<Datos> dataproductos;



  List listPrd;
  int indexProd;
  Delett({this.indexProd, this.listPrd, this.dataproductos});
  @override
  _DelettState createState() => _DelettState();
}

class _DelettState extends State<Delett> {


  void deletProduct() {
    var url = "http://192.168.0.106/tienda/deletProduct.php";
    http.post(url, body: {'id': widget.listPrd[widget.indexProd]['id']});
  }




  @override
  Widget build( context) {
     
            return ListView.builder(
            itemCount: dataproductos.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(dataproductos[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Datos dataproduct, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.redAccent)),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(dataproduct.imgen),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Row(children: <Widget>[
                  Padding(
                      child: Text(
                        dataproduct.nombre,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Text("  \$ "),
                  Padding(
                      child: Text(
                        dataproduct.precio,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ]),
              ],
            ),
          ),
        ),
        //ruta-▲
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.cyanAccent[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  title: Text(
                    "¡¡ Informacion !!",
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new MaterialButton(
                        child: new Text("Ver más detalles"),
                        color: Colors.lightGreenAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          print('click-Detalles');
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new SecondScreen(value: dataproduct),
                          );
                          Navigator.of(context).pushReplacement(route);
                        },
                      ),
                      new MaterialButton(
                        child: new Text("Editar"),
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          print('click-Editar');
                        },
                      ),
                      new MaterialButton(
                        child: new Text("ELIMINAR"),
                        color: Colors.redAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          print('click-borrar');
                        },
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "Aceptar",
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
          /*

          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SecondScreen(value: dataproduct),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);*/
        });
  }
} */
