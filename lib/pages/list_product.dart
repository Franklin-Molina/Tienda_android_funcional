import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/crear_producto.dart';
//import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/detail.dart';
import 'package:proyecto_tienda/pages/detalles_product.dart';
import 'dart:async';
import 'dart:convert';



class LisProduct extends StatefulWidget {
  @override
  _LisProductState createState() => _LisProductState();
}

class _LisProductState extends State<LisProduct> {
  Future<List> getProduct() async {
    final response = await http.get(
      "http://192.168.0.106/tienda/getProduct.php",
    );
    return json.decode(response.body);
  }

//Refresh
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      LisProduct();
      AdProductt();
      DetalProduct();
     // EditDetalles();
    });
    return null;
  }
//
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
           leading: Builder(
             
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.keyboard_backspace),

          onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/allproduct/ListProducto', (Route<dynamic> route) => false);

                      },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
  
        title: new Text("Eliminar productos", textAlign: TextAlign.center),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add,
          color: Colors.redAccent,
        ),
        backgroundColor: Colors.greenAccent,
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AdProductt(),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        child: Material(
            child: SizedBox(
              width: double.minPositive,
              height: 50.0,
            ),
            color: Colors.black),
      ),
      body: RefreshIndicator(//refresh
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                
                  colors: [Colors.blueAccent, Colors.greenAccent,Colors.redAccent])),
          child: new FutureBuilder<List>(
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
        ),
        onRefresh: refreshList, //Refresh
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
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['nombre'],
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                leading: new Icon(
                  Icons.delete_forever,
                  size: 50.0,
                  color: Colors.redAccent,
                ),
                 trailing: Icon(Icons.keyboard_arrow_right),
                subtitle: new Text(
                  "Precio \$ ${list[i]['precio']}",
                  /*  list[i]['precio'],  */
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
