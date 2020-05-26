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

   TextEditingController controllerNombreCateg;

   void editCateg() {
    var url = "http://192.168.0.103/tienda/editCateg.php";
    http.post(url, body: {
      "id": widget.listCatg[widget.indexCatg]['id'],
      "nombre": controllerNombreCateg.text,
     
    });
  }
  @override

    void initState() {
       controllerNombreCateg=  new TextEditingController(text: widget.listCatg[widget.indexCatg]['nombre']);
    super.initState();
  }
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR"),
           actions: <Widget>[
          IconButton(icon: Icon(Icons.category , size: 40.0,color: Colors.red,),
           onPressed: (){
        Navigator.pushReplacementNamed(context, '/pages/listCateg');
           }
           )
        ],
      ),
      body: Form(
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
                    editCateg();
                    Navigator.of(context).pop(new MaterialPageRoute(
                        builder: (BuildContext context) => new LisCatg()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
} 