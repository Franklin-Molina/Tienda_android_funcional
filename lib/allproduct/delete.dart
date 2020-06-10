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


import 'dart:convert';
import 'dart:ffi';

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
  final jsonEndpoint = "http://192.168.100.234/tienda/prueba.php";
 

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

drawer: Menu(),
        appBar: new AppBar(


   /*  leading: Builder(
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
  ), */
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
      
 class Menu extends StatelessWidget{
  
  Widget build(BuildContext context) {
    
    return new Drawer(
      
      child: ListView(
        children: <Widget>[
             
        new UserAccountsDrawerHeader(
          accountEmail: new Text("Kira.ms@gmail.com"),
          
          accountName: Text("Bienvenido", style: TextStyle( fontSize: 40, color: Colors.black87 ) ),
         /*  accountEmail: Text(""), */
          
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/fondo_log.jpg"),
                  fit: BoxFit.cover),
            ),
          
          ),
           Column(
                    children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    Divider(color: Colors.blue,),
                    new MaterialButton(
                      
                      height: 40,
                      minWidth: 200,
                      child: new Text(' Productos Registrados',),
                      color: Colors.blueGrey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/allproduct/ListProducto', (Route<dynamic> route) => false);

                      },
                    ),
                     Divider(color: Colors.blue,),
                    
                    new MaterialButton(
                      height: 40,
                      minWidth: 200.0,
                      child: new Text(' Crear Producto '),
                      color: Colors.orange,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                         onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/pages/crear_producto', (Route<dynamic> route) => false);

                      },
                    ),
                    Divider(color: Colors.blue,),
                    new MaterialButton(
                      height: 40,
                      minWidth: 200.0,

                      child: new Text('Categorias Registradas'),
                      color: Colors.tealAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                       onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/pages/listCateg', (Route<dynamic> route) => false);

                      },
                    ), 
                   
                    Divider(color: Colors.blue,),
                    new MaterialButton(
                      height: 40.0,
                      minWidth: 200.0,
                      child: new Text(' Agregar  Categoria '),
                      color: Colors.lightGreenAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                          onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/pages/addCateg', (Route<dynamic> route) => false);

                      },
                      
                    ),
                     Divider(color: Colors.blue,),
                      new MaterialButton(
                      height: 40,
                      minWidth: 100.0,
                      child: new Text(' Salir'),
                      color: Colors.red,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                         onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/allproduct/ListProducto', (Route<dynamic> route) => false);

                      },
                    ),
                  ]),

        
        ],
      ),
    );
  }



    }