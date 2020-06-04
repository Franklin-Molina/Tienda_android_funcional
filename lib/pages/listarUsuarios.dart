import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/crear_cuenta.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/detail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class ListarUser extends StatefulWidget {
  @override
  _ListarUserState createState() => _ListarUserState();
}

class _ListarUserState extends State<ListarUser> {

  var refreshKey = GlobalKey<RefreshIndicatorState>();

    void initState() {
    super.initState();
    refreshList();
    }
  
   
    
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));


    return null;
  }
  
  //Traer arreglo json.de la db y y lo inserta en reponse
  Future<List> getData() async {
    final response = await http.get(
      "http://192.168.0.109/tienda/getdata.php",
    );
    return json.decode(response.body); 
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Text('Usuarios Registrados'),
     /*         actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app , size: 40.0,color: Colors.red,),
           onPressed: (){
         Navigator.pushReplacementNamed(context, '/LoginPage');
           }
           )
        ], */
      ),
   

/* 
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
        
        )),
      ), */
    
       body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
               colors: [Colors.redAccent,Colors.greenAccent[100]])),
         child: new FutureBuilder<List>( //Llamar el listado de usuarios
            key: refreshKey,
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error); //Si hay fallo lo imprime en consola
            return snapshot.hasData
                ? new ItemList( //Si no hay errores Mostrar el listado
                    list: snapshot.data,//llenada datos
                  )
                : new Center(
                    child: new CircularProgressIndicator(),//Miestras carga 
                  
                  );
          },
      ),
       ), 
    );
    
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
       return LiquidPullToRefresh(
    onRefresh:() async{
      return await Future.delayed(Duration(seconds: 2));
       
    },
        child: ListView.builder(
           itemCount: list == null ? 0 : list.length,
           itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),//DIseño de la lista ↓
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(//Lo que muestra al darle click
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['username'],
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                leading: new Icon(
                  Icons.person_pin,
                  size: 77.0,
                  color: Colors.red,
                ),
                subtitle: new Text(
                  "Telefono : ${list[i]['telefono']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ),
            ),
          ),
        );
      
      },
        
        
        ),
     );
   
  }
  //Refres Opcion1
   Widget _listaRefres(){
     return LiquidPullToRefresh(
    onRefresh:() async{
      return await Future.delayed(Duration(seconds: 2));
       
    },
        child: ListView.builder(
           itemCount: list == null ? 0 : list.length,
           itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['username'],
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
                leading: new Icon(
                  Icons.person_pin,
                  size: 77.0,
                  color: Colors.red,
                ),
                subtitle: new Text(
                  "Telefono : ${list[i]['telefono']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ),
            ),
          ),
        );
      
      },
        
        
        ),
     );
   }
}
 

