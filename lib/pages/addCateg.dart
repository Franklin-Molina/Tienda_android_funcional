import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:http/http.dart' as http;


class AddCatg extends StatefulWidget {
  @override
  _AddCatgState createState() => _AddCatgState();
}

class _AddCatgState extends State<AddCatg> {
  TextEditingController controllerCategoria = new TextEditingController();
  var _formKey = GlobalKey<FormState>();
  
  void addCateg() {
    var url = "http://192.168.0.105/tienda/addCateg.php";

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
          IconButton(icon: Icon(Icons.category , size: 40.0,color: Colors.red,),
           onPressed: (){
        Navigator.pushReplacementNamed(context, '/pages/listCateg');
           }
           ),
             IconButton(icon: Icon(Icons.add_shopping_cart , size: 40.0,color: Colors.red,),
           onPressed: (){
        Navigator.pushReplacementNamed(context, '/pages/crear_producto');
           }
           )
        ],
      ),
      body: Form(
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
                  new RaisedButton(
                    child: new Text("Guardar"),
                    color: Colors.lightGreenAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addCateg();
                        Navigator.pop(context);
                      }
                    },
                  ),
                 /*  new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/powerPage');
                    },
                  ), */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}