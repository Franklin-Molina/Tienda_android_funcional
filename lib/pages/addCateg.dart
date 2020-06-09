import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class AddCatg extends StatefulWidget {
  @override
  _AddCatgState createState() => _AddCatgState();
}

class _AddCatgState extends State<AddCatg> {

 
  final titulo = TextStyle(color: Colors.black, fontSize: 15.0);
  TextEditingController controllerCategoria = new TextEditingController();
  var _formKey = GlobalKey<FormState>();
  

    String res = '';
  void addCateg() {
    
    var url = "http://192.168.0.106/tienda/addCateg.php";

    http.post(url, body: {
      "nombre": controllerCategoria.text,
    });



  }




  
 


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Agregar Categoria"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.category,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/pages/listCateg');
              }),
          IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/pages/crear_producto');
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.cyanAccent,
              Colors.white,
              Colors.blueAccent[400]
            ])),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.category, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerCategoria,
                        validator: (value) {
                          if (value.isEmpty) return "Ingrese una Categoria";
                        },
                        decoration: new InputDecoration(
                          hintText: "Categoria",
                          labelText: "Categoria",
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1.0,
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new MaterialButton(
                       height: 40.0,
                      minWidth: 600.0,
                      child: new Text("Guardar"),
                      color: Colors.lightGreenAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {

                          return addCateg();
                          /*  Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/pages/listCateg',
                                                (Route<dynamic> route) =>
                                                    false);
                                        return addCateg(); */
                        /*   showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.cyanAccent[100],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  title: Text(
                                    "¡¡ Successfull !!",
                                    style: TextStyle(color: Colors.green),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "Categoria creada con exito!! ",
                                        style: titulo,
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(),
                                      Icon(
                                        Icons.category,
                                        color: Colors.green,
                                        size: 73.0,
                                      )
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "Aceptar",
                                        style: titulo,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/pages/listCateg',
                                                (Route<dynamic> route) =>
                                                    false);
                                        return addCateg();
                                      },
                                    ),
                                  ],
                                );
                              }); */
                        } else {
                          print('Datos vacios');
                        }
                      },
                    ),
                  
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
