import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => new _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final titulo = TextStyle(color: Colors.black, fontSize: 15.0);

  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerPrecio = new TextEditingController();
  TextEditingController controllerdescripcion = new TextEditingController();
  TextEditingController controllerCategoria = new TextEditingController();

  // TextEditingController controllerImagen = new TextEditingController();  //Por agg imagen
  List<DropdownMenuItem<String>> _ciudadItems;

  var _formKey = GlobalKey<FormState>();
  File _imagenfile;

  _galeria() async {
    var imagen = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _imagenfile = imagen;
    });
  }

  _camara() async {
    var imagen = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _imagenfile = imagen;
    });
  }

  void addProduct() {
    var url = "http://192.168.0.106/tienda/addProduct.php";

    http.post(url, body: {
      "nombre": controllerNombre.text,
      "precio": controllerPrecio.text,
      "descripcion": controllerdescripcion.text,
      "id_catg_producto": controllerCategoria.text,
    });
  }

  refreshproduct() {
    setState(() {
      addProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Agregar Producto"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.category,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new LisCatg()));
                //Navigator.pushReplacementNamed(context, '/pages/listCateg');
                //  Navigator.of(context).pushNamedAndRemoveUntil('/pages/listCateg', (Route<dynamic> route) => false);
              }),
          IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/list_product', (Route<dynamic> route) => false);
              }),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red, Colors.white])),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new ListTile(
                      leading:
                          const Icon(Icons.rate_review, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerNombre,
                        validator: (value) {
                          if (value.isEmpty)
                            return " Ingrese el nombre del producto ";
                        },
                        decoration: new InputDecoration(
                          hintText: "Producto",
                          labelText: "Producto",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.monetization_on,
                          color: Colors.black),
                      title: new TextFormField(
                        controller: controllerPrecio,
                        validator: (value) {
                          if (value.isEmpty) return "Ingresa un precio";
                        },
                        decoration: new InputDecoration(
                          hintText: "Precio",
                          labelText: "Precio",
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    new ListTile(
                      leading:
                          const Icon(Icons.description, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerdescripcion,
                        validator: (value) {
                          if (value.isEmpty)
                            return "Ingrese una descricion de su producto";
                        },
                        decoration: new InputDecoration(
                          hintText: "Descripcion",
                          labelText: "Descripcion",
                        ),
                      ),
                    ),
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
                    new RaisedButton(
                      child: new Text("Guardar"),
                      color: Colors.lightGreenAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          showDialog(
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
                                        "Producto Creado Con exito!! ",
                                        style: titulo,
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(),
                                      Icon(
                                        Icons.add_shopping_cart,
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
                                   
                                        addProduct();
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/pages/list_product',
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          print('Datos incorrectos');
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
