import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/listarUsuarios.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  final titulo = TextStyle(color: Colors.black, fontSize: 15.0);

  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();
  TextEditingController controllerDireccion = new TextEditingController();
  TextEditingController controllerCiudad = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData() {
    var url = "http://192.168.42.170/tienda/adddata.php";

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
          /*   IconButton(
              icon: Icon(
                Icons.exit_to_app,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/LoginPage');
              }) */
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.greenAccent, Colors.white])),
        child: Form(
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
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),

                        // keyboardType: TextInputType.number,//Para solo numeros
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
                      leading:
                          const Icon(Icons.call_split, color: Colors.black),
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
                      child: new Text(
                        "Guardar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.black,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
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
                                        "Cuenta creada con exito!! ",
                                        style: titulo,
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(),
                                      Icon(
                                        Icons.perm_identity,
                                        color: Colors.green,
                                        size: 73.0,
                                      )
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Aceptar",style: titulo,),
                                      onPressed: () {
                                        addData();
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/pages/login',
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                    ),
                                  ],
                                );
                              });
                          /*  addData();
                          Navigator.pushReplacementNamed(context,'/pages/login');   */
                        } else {
                          print('Datos errones');
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
      ),
    );
  }
}
