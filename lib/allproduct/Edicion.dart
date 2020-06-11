import 'package:flutter/material.dart';
import 'package:proyecto_tienda/allproduct/Clase.dart';
import 'package:proyecto_tienda/allproduct/detalles.dart';
import 'package:proyecto_tienda/pages/prueba.dart';

class CustomListView extends StatelessWidget {


  
  final List<Datos> dataproductos;

  CustomListView(this.dataproductos);

  Widget build(context) {

    
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
                            style: new TextStyle(fontStyle: FontStyle.italic,color: Colors.red),
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
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.cyanAccent[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  title: Text(
                    "¡¡ Mas detalles !!",
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new MaterialButton(
                        height: 40,
                        child: new Text("Ver",style: TextStyle(color: Colors.white),),
                        color: Colors.purpleAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          print('click-Detalles');
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new SecondScreen(value: dataproduct),
                          );
                          Navigator.of(context).pushReplacement(route);
                        },
                      ),
                    /*   new MaterialButton(
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
                      ), */
                    ],
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      color: Colors.black,
                      child: Text(
                        "Regresar",
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
}
