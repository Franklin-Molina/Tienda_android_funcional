import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/listarUsuarios.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();
  TextEditingController controllerDireccion = new TextEditingController();
  TextEditingController controllerCiudad = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData() {
    var url = "http://192.168.0.103/tienda/adddata.php";

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "telefono": controllerTelefono.text,
      "ciudad": controllerCiudad.text,
      "direccion": controllerDireccion.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crear Cuenta"),
        actions: <Widget>[
          
         
           IconButton(
              icon: Icon(
                Icons.exit_to_app,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/LoginPage');
              })
              
              
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
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Ingresa un nombre de usuario";
                      },
                      decoration: new InputDecoration(
                        hintText: "Usuario",
                        labelText: "Usuario",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.vpn_key, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Contraseña";
                      },
                      decoration: new InputDecoration(
                        hintText: "Contraseña",
                        labelText: "Contraseña",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.phone_android, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerTelefono,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un Telefono";
                      },
                      decoration: new InputDecoration(
                        hintText: "Telefono",
                        labelText: "Telefono",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.location_city, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCiudad,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una ciudad";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ciudad",
                        labelText: "Ciudad",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.call_split, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDireccion,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una direccion";
                      },
                      decoration: new InputDecoration(
                        hintText: "Direccion",
                        labelText: "Direccion",
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Guardar"),
                    color: Colors.greenAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addData();
                        Navigator.pushReplacementNamed(context, '/LoginPage');
                      }
                    },
                  ),
                  /*      new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/LoginPage');
                    },
                  ), */
                  /*-------------------------*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
