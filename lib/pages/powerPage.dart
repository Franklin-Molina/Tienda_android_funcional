import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_tienda/allproduct/Clase.dart';
import 'package:proyecto_tienda/allproduct/Edicion.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/detalles_product.dart';
import 'package:proyecto_tienda/pages/list_product.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
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
      throw Exception(
          'We were not able to successfully download the json data.');
  }
  //

  //Refresh
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      LisProduct();
      AdProductt();
      DetalProduct();
      //  EditDetalles();
    });
    return null;
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: new AppBar(
        title: new Text(" Administrador"),
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
        child: new FutureBuilder<List<Datos>>(
          future: downloadJSON(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datos> spacecrafts = snapshot.data;
              return new CustomListView(spacecrafts);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return new CircularProgressIndicator();
          },
        ),
        onRefresh: refreshList, //Refresh
      ),
    );
  }
}

class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountEmail: new Text("Kira@gmail.com"),
            accountName: Text("Administrador",
                style: TextStyle(fontSize: 40, color: Colors.black87)),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/fondo_log.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            Divider(
              color: Colors.blue,
            ),
            ListTile(
              title: Text("Lista Productos "),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/allproduct/ListProducto',
                    (Route<dynamic> route) => false);
              },
            ),
            Divider(
              color: Colors.blue,
            ),
            ListTile(
              title: Text("Crear Producto "),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/crear_producto', (Route<dynamic> route) => false);
              },
            ),
            Divider(
              color: Colors.blue,
            ),
            ListTile(
              title: Text("Categorias Registradas "),
              leading: Icon(Icons.category, color: Colors.black),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/listCateg', (Route<dynamic> route) => false);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Agregar Categoria"),
              leading: Icon(Icons.category, color: Colors.black),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/addCateg', (Route<dynamic> route) => false);
              },
            ),
            ListTile(
              title: Text("Lista Usuarios"),
              leading: Icon(Icons.perm_identity, color: Colors.black),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/listarUsuarios', (Route<dynamic> route) => false);
              },
            ),
            ListTile(
              title: Text("Salir"),
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              trailing: Icon(Icons.keyboard_arrow_right),
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
                          "¡¡ Precaución !!",
                          style: TextStyle(color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "¿Esta seguro de salir? ",
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.report_problem,
                              color: Colors.yellow,
                              size: 73.0,
                            )
                          ],
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            color: Colors.red,
                            child: Text(
                              "SI",
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/pages/slider',
                                  (Route<dynamic> route) => false);
                            },
                          ),
                          VerticalDivider(
                            color: Colors.red,
                          ),
                          MaterialButton(
                            color: Colors.green,
                            child: Text(
                              "No",
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ]),
        ],
      ),
    );
  }
}
