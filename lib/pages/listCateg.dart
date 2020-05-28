 import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/addCateg.dart';
import 'package:proyecto_tienda/pages/detalles_categ.dart';

class LisCatg extends StatefulWidget {
  @override
  _LisCatgState createState() => _LisCatgState();
}

class _LisCatgState extends State<LisCatg> {


  
  Future<List> getCateg() async{
    final response = await http.get("http://192.168.0.105/tienda/getCateg.php",);
    return json.decode(response.body);
    

   
  }
  
  @override
  
  Widget build(BuildContext context) {
    
   return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listado de Categorias"),
      /*   actions: <Widget>[
          IconButton(icon: Icon(Icons.search , size: 40.0,color: Colors.red,),
           onPressed: (){
         Navigator.pushReplacementNamed(context, '/Gneralprudcut');
           }
           )
        ], */
      ),

     floatingActionButton: new FloatingActionButton.extended(
       onPressed: () => Navigator.of(context).push(new MaterialPageRoute(    //Crear categorias con el boron
             builder: (BuildContext context) => new AddCatg(),
            )),
      
        icon: new Icon(Icons.add),
        label: const Text("Agregar categorias"),
        backgroundColor: Colors.green,
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
       
       
        child: Material(
          child: SizedBox(width: double.infinity, height: 40.0,),
         color: Colors.black
        ),
      ), 

      

      body: new FutureBuilder<List>(
        future: getCateg(),
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
                      builder: (BuildContext context) => new DetallesCatg(  //Detalles de las categorias
                            listCatg: list,
                            indexCatg: i,
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
                  Icons.category,
                  size: 50.0,
                  color: Colors.black,
                ),
              
              ),
            ),
            
          ),
        );
      },
    );
  }
} 