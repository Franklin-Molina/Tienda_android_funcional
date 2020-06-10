import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_tienda/allproduct/Clase.dart';
import 'package:proyecto_tienda/allproduct/Edicion.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/detalles_product.dart';
import 'package:proyecto_tienda/pages/editProduct.dart';
import 'package:proyecto_tienda/pages/list_product.dart';
import 'package:proyecto_tienda/pages/prueba.dart';










class Listado extends StatefulWidget {
  @override
  _ListadoState createState() => _ListadoState();
}

class _ListadoState extends State<Listado> {



  //
  Future<List<Datos>> downloadJSON() async {
  final jsonEndpoint = "http://192.168.0.106/tienda/prueba.php";
 

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List dataproductos = json.decode(response.body);
    return dataproductos
        .map((spacecraft) => new Datos.fromJson(spacecraft))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}
  //

  //Refresh
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      LisProduct();
      AdProductt();
      DetalProduct();
      EditDetalles();
    });
    return null;
  }
//
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
                  leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.keyboard_backspace,color: Colors.red,),

          onPressed: () {
                Navigator.pushReplacementNamed(context, '/pages/view_product');
                // Navigator.of(context).pushNamedAndRemoveUntil('/pages/view_product', (Route<dynamic> route) => false);
              },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
        title: new Text("Listado de Productos"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/view_product', (Route<dynamic> route) => false);
              })
        ],
      ),
       floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add,
          color: Colors.redAccent,
        ),
        backgroundColor: Colors.greenAccent,
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AdProductt(),
        )),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: Material(
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
            ),
            color: Colors.black),
      ),
        body: new RefreshIndicator(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Datos>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datos> spacecrafts = snapshot.data;
                return new CustomListView(spacecrafts);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return new CircularProgressIndicator();
            },
          ),
           onRefresh: refreshList, //Refresh
        ),
        
      
    );
  }
  }
