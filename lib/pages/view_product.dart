import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/addCateg.dart';
import 'package:proyecto_tienda/pages/crear_producto.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';
import 'package:proyecto_tienda/pages/list_product.dart';








class Gneralprudcut extends StatelessWidget {
  final titulo = TextStyle(color: Colors.white, fontSize: 15.0);
  
  @override
  Widget build(BuildContext context) {
      void confirm() {
      AlertDialog alertDialog = new AlertDialog(
        content: new Text("¿Esta seguro de Salir?"),
        actions: <Widget>[
         
          new RaisedButton(
            child: new Text(
              " Si",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/pages/slider', (Route<dynamic> route) => false);
            },
          ),
          VerticalDivider(),
          new RaisedButton(
            child:
                new Text("No", style: new TextStyle(color: Colors.white)),
            color: Colors.green,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );

      showDialog(
          context: context, barrierDismissible: false, child: alertDialog);
    }
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text( 'Administracion-Productos',textAlign: TextAlign.center,),),
        
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40.0,
                  color: Colors.red,
                ),
                  onPressed: () => confirm(),
               )
          ],
        ),
       backgroundColor: Colors.cyanAccent[200],
       
        
        body: Container(
          child: new Padding(               
           padding: const EdgeInsets.all(60.0),         
            child: Column(
              
              children: <Widget>[
                Container(
                  
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    //  colors: [Colors.teal[300],Colors.lightBlue[200],Colors.greenAccent[200]])),
                       colors: [Colors.white,Colors.greenAccent,Colors.red])),
                
                  
                    child: Column(
                    children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new MaterialButton(
                      
                      height: 40,
                      minWidth: 200,
                      child: new Text(' Productos Registrados',style: titulo,),
                      color: Colors.blueGrey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/allproduct/ListProducto', (Route<dynamic> route) => false);

                      },
                    ),
                     Divider(color: Colors.red,),
                    
                    new MaterialButton(
                      height: 40,
                      minWidth: 200.0,
                      child: new Text(' Crear Producto '),
                      color: Colors.orange,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                         onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/pages/crear_producto', (Route<dynamic> route) => false);

                      },
                    ),
                    Divider(color: Colors.redAccent,),
                    new MaterialButton(
                      height: 40,
                      minWidth: 200.0,

                      child: new Text('Categorias Registradas'),
                      color: Colors.tealAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                       onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/pages/listCateg', (Route<dynamic> route) => false);

                      },
                    ), 
                   
                    Divider(color: Colors.black,),
                    new MaterialButton(
                      height: 40.0,
                      minWidth: 200.0,
                      child: new Text(' Agregar  Categoria '),
                      color: Colors.lightGreenAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                          onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil( '/pages/addCateg', (Route<dynamic> route) => false);

                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 
}
 