import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/listCateg.dart';

class EditCateg extends StatefulWidget {
  final List listCatg;
  final int indexCatg;

  EditCateg({this.indexCatg, this.listCatg});

  @override
  _EditCategState createState() => _EditCategState();
}

class _EditCategState extends State<EditCateg> {
   final titulo = TextStyle(color: Colors.black, fontSize: 15.0);
   var _validacion = GlobalKey<FormState>();
  TextEditingController controllerNombreCateg;

  void editCateg() {
    var url = "http://192.168.0.109/tienda/editCateg.php";
    http.post(url, body: {
      "id": widget.listCatg[widget.indexCatg]['id'],
      "nombre": controllerNombreCateg.text,
    });
  }

  @override
  void initState() {
    controllerNombreCateg = new TextEditingController(
        text: widget.listCatg[widget.indexCatg]['nombre']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.category,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                // Navigator.pushReplacementNamed(context, '/pages/listCateg');
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/listCateg', (Route<dynamic> route) => false);
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
          key: _validacion,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.rate_review, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombreCateg,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una categoria";
                      },
                      decoration: new InputDecoration(
                        hintText: "Nombre categoria",
                        labelText: "Nombre categoria",
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
                    color: Colors.greenAccent,
                    onPressed: () {
                      if(_validacion.currentState.validate()){

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
                                        "Categoria editada con exito!! ",
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
                                        editCateg();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/pages/listCateg', (Route<dynamic> route) => false);
                                       
                                      },
                                    ),
                                  ],
                                );
                              });
                         /*   */
                      }else{
                        print('error al editar producto');

                      }
                     
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
