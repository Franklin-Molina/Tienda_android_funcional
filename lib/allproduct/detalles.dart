import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_tienda/allproduct/Clase.dart';
import 'package:proyecto_tienda/pages/prueba.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {



  List listPrd;
  int indexProd;
  final Datos value;

  //SecondScreen({this.indexProd, this.listPrd, this.value});
  SecondScreen({Key key, this.value, this.indexProd, this.listPrd})
      : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

/* ------------------ */
//
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

  String _dropdownValue ;

  Map<String, String> liscatgmp = Map();
  void mostrarcategoria() {
    for (var i = 0; i < datos.length; i++) {
      liscatgmp[datos[i]['id']] ="[" +datos[i]["id"]+"]"+ "→ "+ datos[i]['nombre'];
    }
    _dropdownValue = liscatgmp[datos[0]['id']];
  }

//
/* ----------------- */


  void deletProduct() {
    var url = "http://192.168.0.106/tienda/deletProduct.php";
    http.post(url, body: {'id': widget.listPrd[widget.indexProd]['id']});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text( '  ${widget.value.nombre}'),
        
        backgroundColor: Colors.black,
      ),
      body: new SingleChildScrollView(
        
        child: new Center(
          child: Column(
            children: <Widget>[
            
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                child: Image.network('${widget.value.imgen}'),
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                child: new Text(
                  'Nombre : ${widget.value.nombre}',
                  style: new TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  '\$ : ${widget.value.precio}',
                  style: new TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  'Descripcion : ${widget.value.descripcion}',
                  style: new TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  'Categoria : ${widget.value.categoria}',
                  style: new TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Divider(),
              new Text('Categorias '),
              new Container(
                  child: DropdownButton<String>(
          value: _dropdownValue,
          onChanged: (String newValue) {
            setState(() {
              _dropdownValue = newValue;
            });
          },
          items: liscatgmp.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /* new RaisedButton(
                        child: new Text("EDITAR"),
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditDetalles(
                            list: widget.listPrd,
                            index: widget.indexProd,
                          ),
                        )),
                      ),*/
                  /*  Container(
                         child: _image == null ? new Text('NO hay image')
                         : new Image.file(_image),
                      
                      
                      
                      ),*/
                  VerticalDivider(),
                /*  new RaisedButton(
                    child: new Text("ELIMINAR"),
                    color: Colors.redAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
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
                                    "¿Esta seguro de Eliminar? → ${widget.value.nombre}",
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
                                    deletProduct();
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
                  ),*/
                  /*   VerticalDivider(),
                       new RaisedButton(
                      child: new Text("Salir"),
                      color: Colors.yellow,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      onPressed: () {
                       Navigator.pushReplacementNamed(context, '/pages/list_product');
                    
                      },
                    ),*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
