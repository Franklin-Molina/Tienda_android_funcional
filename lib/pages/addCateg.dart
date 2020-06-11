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
 
  Future <List> _guardarcat(BuildContext context) async{
    final regitrarcat = await http.post("http://192.168.0.106/tienda/addCateg.php",body: {
      "nombre": controllerCategoria.text,
    });

    var catregistradas = json.decode(regitrarcat.body);

    if(catregistradas.length != 0)
    {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          elevation:0,
         /*  backgroundColor: Colors.red[200], */
          title: Text('ERROR'),
         content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "Categoria existente!! ",
                                        style: titulo,
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(),
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                        size: 73.0,
                                      )
                                    ],
                                  ),
          
          actions: <Widget>[
          
            FlatButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black)
              
              ),
              onPressed: (){
                Navigator.pop(context,);
              },
            )
          ],
        ),
      );
    }else{
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          elevation:0,
          backgroundColor: Colors.lightBlueAccent,
          title: Text('!! Succesfull !'),
          content: Text('esta categoria se registro con exito!'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300)
              ),
              onPressed: (){
              Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/pages/listCateg',
                                                (Route<dynamic> route) =>
                                                    false);
              },
            )
          ],
        ),
      );
    }  
  }


  ///




  
 


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
                         leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.keyboard_backspace,color: Colors.red,),

          onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/allproduct/ListProducto', (Route<dynamic> route) => false);

                      },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
        
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

                         _guardarcat(context);
                          
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
