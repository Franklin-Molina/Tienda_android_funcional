import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/list_product.dart';

class EditDetalles extends StatefulWidget {
  final List list;
  final int index;

  EditDetalles({this.index, this.list});

  @override
  _EditDetallesState createState() => _EditDetallesState();
}

class _EditDetallesState extends State<EditDetalles> {
  //para la base
  TextEditingController controllerNombre;
  TextEditingController controllerPrecio;
  TextEditingController controllerDescripcion;
  TextEditingController controllerCategoria;
 // TextEditingController controllerImagen;


  void editProduc() {
    var url = "http://192.168.0.105/tienda/editProduc.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nombre": controllerNombre.text,
      "precio": controllerPrecio.text,
      "descripcion": controllerDescripcion.text,
      "id_catg_producto": controllerCategoria.text,
     // "imagen": controllerDireccion.text,
    });
  }

  @override
  void initState() {
    controllerNombre =
        new TextEditingController(text: widget.list[widget.index]['nombre']);
    controllerPrecio =
        new TextEditingController(text: widget.list[widget.index]['precio']);
    controllerDescripcion =
        new TextEditingController(text: widget.list[widget.index]['descripcion']);
     controllerCategoria =
        new TextEditingController(text: widget.list[widget.index]['categ']);
 
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
         Navigator.popAndPushNamed(context, '/pages/list_product');
         //Navigator.of(context).pushNamedAndRemoveUntil('/pages/list_product', (Route<dynamic> route) => false);
           }
           )
        ],
      ),
      body: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red,Colors.white])),
        child: Form(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.rate_review, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombre,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un nombre para el producto";
                      },
                      decoration: new InputDecoration(
                        hintText: "Nombre",
                        labelText: "Nombre",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.monetization_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPrecio,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa un Precio";
                      },
                      decoration: new InputDecoration(
                        hintText: "Precio",
                        labelText: "Precio",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.description,
                        color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDescripcion,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Descripcion";
                      },
                      decoration: new InputDecoration(
                        hintText: "Descripcion",
                        labelText: "Descripcion",
                      ),
                    ),
                  ),
                      new ListTile(
                    leading: const Icon(Icons.category,
                        color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCategoria,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa una Categoria";
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
                    color: Colors.greenAccent,
                    onPressed: () {
                      editProduc();
                      Navigator.of(context).pop(new MaterialPageRoute(
                          builder: (BuildContext context) => new LisProduct()));
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
 