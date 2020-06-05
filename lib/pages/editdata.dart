import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/listarUsuarios.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.index, this.list});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  //para la base
  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerTelefono;
  TextEditingController controllerCiudad;
  TextEditingController controllerDireccion;

  void editData() {
    var url = "http://192.168.0.106/tienda/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "telefono": controllerTelefono.text,
      "ciudad": controllerCiudad.text,
      "direccion": controllerDireccion.text,
    });
  }

  @override
  void initState() { //Estado de inicializacion -Listado a editar
    controllerUsername =
        new TextEditingController(text: widget.list[widget.index]['username']);
    controllerPassword =
        new TextEditingController(text: widget.list[widget.index]['password']);
    controllerTelefono =
        new TextEditingController(text: widget.list[widget.index]['telefono']);
    controllerCiudad =
        new TextEditingController(text: widget.list[widget.index]['ciudad']);
    controllerDireccion =
        new TextEditingController(text: widget.list[widget.index]['direccion']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR"),
           actions: <Widget>[
          IconButton(icon: Icon(Icons.home , size: 40.0,color: Colors.red,),
           onPressed: (){
         Navigator.pushReplacementNamed(context, '/pages/listarUsuarios');
           }
           )
        ],
      ),
      body: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.redAccent,Colors.greenAccent[100]])),
        child: Form(//Formulario 
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                      validator: (value) {//SI el campo esta vacio
                        if (value.isEmpty) return "Ingresa un nombre de usurio";
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
                    leading: const Icon(Icons.phone_android,
                        color: Colors.black),
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
                    leading: const Icon(Icons.location_city,
                        color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCiudad,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Ciudad";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ciudad",
                        labelText: "Ciudad",
                      ),
                    ),
                  ),
                    new ListTile(
                    leading: const Icon(Icons.call_split,
                        color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDireccion,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Direccion";
                      },
                      decoration: new InputDecoration(
                        hintText: "Direccion",
                        labelText: "Direccion",
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
                    color: Colors.blueAccent,
                    onPressed: () {
                      editData();
                      Navigator.of(context).pop(new MaterialPageRoute(
                          builder: (BuildContext context) => new ListarUser()));
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
