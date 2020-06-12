import 'package:flutter/material.dart';
import 'package:proyecto_tienda/allproduct/Clase.dart';
import 'package:proyecto_tienda/allproduct/detalles.dart';

class CustomListView extends StatelessWidget {
  final List<Datos> dataproductos;

  CustomListView(this.dataproductos);

  Widget build(context) {
    return Container(
      child: ListView.builder(
        itemCount: dataproductos.length,
        itemBuilder: (context, int currentIndex) {
          return createViewItem(dataproductos[currentIndex], context);
        },
      ),
    );
  }

  Widget createViewItem(Datos dataproduct, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.cyanAccent,
              Colors.white,
              Colors.blueAccent[400]
            ])),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(dataproduct.imgen),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  child: Wrap(children: <Widget>[
                    Padding(
                        child: Text(
                          dataproduct.nombre,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(1.0)),
                    Text("  \$ "),
                    Container(
                      child: Padding(
                          child: Text(
                            dataproduct.precio,
                            style: new TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                            textAlign: TextAlign.right,
                          ),
                          padding: EdgeInsets.all(1.0)),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        //ruta-▲
        onTap: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SecondScreen(value: dataproduct),
          );

          Navigator.of(context).push(route);
        });
  }
}
