import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/detail.dart';
import 'package:proyecto_tienda/pages/detalles_product.dart';
import 'dart:async';
import 'dart:convert';

import 'package:proyecto_tienda/pages/registroUsuarios.dart';
 

class LisProduct extends StatefulWidget {
  @override
  _LisProductState createState() => _LisProductState();
}

class _LisProductState extends State<LisProduct> {


  Future<List> getProduct() async{
    final response = await http.get("http://192.168.0.118/tienda/getProduct.php",);
    return json.decode(response.body);

   
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listado de productos"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app , size: 40.0,color: Colors.red,),
           onPressed: (){
         Navigator.pushReplacementNamed(context, '/LoginPage');
           }
           )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add ,
          color: Colors.black,
           ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
             builder: (BuildContext context) => new AddProduct(),
            )),
      ), 
      

      body: new FutureBuilder<List>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new DetalProduct(
                            listPrd: list,
                            indexProd: i,
                          )
                          ),
                ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['nombre'],
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                leading: new Icon(
                  Icons.add_shopping_cart,
                  size: 50.0,
                  color: Colors.green,
                ),
                subtitle: new Text(
                  list[i]['descripcion'],           
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ),
            ),
            
          ),
        );
      },
    );
  }
}