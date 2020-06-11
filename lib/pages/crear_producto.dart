import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/listCateg.dart';

class AdProductt extends StatefulWidget {
  @override
  _AdProducttState createState() => _AdProducttState();
}

class _AdProducttState extends State<AdProductt> {
/*    ------------------------------ */

  void initState() {
    super.initState();
    getCateg();
  }

  List datos;
  Future<Null> getCateg() async {
    final response = await http.get(
      "http://192.168.0.106/tienda/pt.php",
    );
    setState(() {
      datos = json.decode(response.body);
    });

    mostrarcategoria();
  }

  String _dropdownValue;

  Map<String, String> liscatgmp = Map();
  void mostrarcategoria() {
    for (var i = 0; i < datos.length; i++) {
      liscatgmp[datos[i]['id']] =
          "[" + datos[i]["id"] + "]" + "→ " + datos[i]['nombre'];
    }
    _dropdownValue = liscatgmp[datos[0]['id']];
  }

/* ---------------------------------- */

  File _image;
  var _formKey = GlobalKey<FormState>();
  TextEditingController nombreimg = new TextEditingController();
  //---------------
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerPrecio = new TextEditingController();
  TextEditingController controllerdescripcion = new TextEditingController();
  TextEditingController controllerCategoria = new TextEditingController();

  Future getImageGallery() async {
    var imgeFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 200.0, maxWidth: 200.0);

    setState(() {
      _image = imgeFile;
    });
  }

  Future getImageCamera() async {
    var imgeFile = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 200.0, maxWidth: 200.0);
    setState(() {
      _image = imgeFile;
    });
  }

  Future upload(File imgeFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imgeFile.openRead()));
    var length = await imgeFile.length();
    var uri = Uri.parse("http://192.168.0.106/tienda/img.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imgeFile.path));

    request.fields['nombre'] = controllerNombre.text;
    request.fields['precio'] = controllerPrecio.text;
    request.fields['descripcion'] = controllerdescripcion.text;
    request.fields['id_catg_producto'] = controllerCategoria.text;
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/allproduct/ListProducto',
                      (Route<dynamic> route) => false);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
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
                      '/allproduct/ListProducto',
                      (Route<dynamic> route) => false);
                }),
          ],
        ),
        body: Container(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(children: <Widget>[
                      new Column(
                        children: <Widget>[
                          Center(
                            child: _image == null
                                ? new Text('Selecione una imagen')
                                : new Image.file(_image),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(75, 0, 10, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.pink,
                                  ),
                                  onPressed: getImageGallery,
                                ),
                                VerticalDivider(),
                                RaisedButton(
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.pink,
                                  ),
                                  onPressed: getImageCamera,
                                ),
                              ],
                            ),
                          ),
                          new ListTile(
                            leading: const Icon(Icons.rate_review,
                                color: Colors.black),
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
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                            ),
                          ),
                          new ListTile(
                            leading: const Icon(Icons.description,
                                color: Colors.black),
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
                          Divider(),
                          new Text(
                              'Busque su categoria y luego escriba el numero de ella'),
                          new Text(
                              '→ Si no esta su categoria puede agregarla '),
                          Divider(),
                          ListTile(
                            title: Text("Agregar Categoria "),
                            leading: Icon(Icons.category, color: Colors.black),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/pages/addCateg',
                                  (Route<dynamic> route) => false);
                            },
                          ),
                          Divider(),
                          new Container(
                              child: DropdownButton<String>(
                            value: _dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                _dropdownValue = newValue;
                              });
                            },
                            items: liscatgmp.values
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                          new ListTile(
                            leading:
                                const Icon(Icons.category, color: Colors.black),
                            title: new TextFormField(
                              controller: controllerCategoria,
                              validator: (value) {
                                if (value.isEmpty)
                                  return "Ingrese una categoria";
                              },
                              decoration: new InputDecoration(
                                hintText: "Numero de Categoria",
                                labelText: "Numero de categoria",
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                            ),
                          ),
                          /*     new Container(
                            padding: EdgeInsets.fromLTRB(18, 0, 10, 10),
                              child: DropdownButtonFormField(
                        
                        decoration: InputDecoration(
                          labelText: 'Categoria',
                          icon: Icon(
                            Icons.category,
                            color: Colors.black,
                          ),
                        ),
                      ),
                          ), */

                          Divider(),
                          MaterialButton(
                            height: 40.0,
                            minWidth: 600.0,
                            color: Colors.greenAccent,
                            child: Text('Guardar'),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            onPressed: () {
                              // addProduct();

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
                                            ),
                                            onPressed: () {
                                              upload(_image);
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/allproduct/ListProducto',
                                                      (Route<dynamic> route) =>
                                                          false);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              }
                            },
                          )
                        ],
                      ),
                    ])))));
  }
}
