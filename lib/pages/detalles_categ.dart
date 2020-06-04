import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/pages/editCateg.dart';
import 'package:proyecto_tienda/pages/listCateg.dart';

class DetallesCatg extends StatefulWidget {

  List listCatg;
  int indexCatg;
  DetallesCatg({this.listCatg,this.indexCatg});


  @override
  _DetallesCatgState createState() => new  _DetallesCatgState();

  
}

class _DetallesCatgState extends State<DetallesCatg> {

  void deleteCatg(){
  var url="http://192.168.0.109/tienda/deleteCatg.php";
  http.post(url, body: {
    'id': widget.listCatg[widget.indexCatg]['id']
  });
}

void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("Esta seguro de eliminar '${widget.listCatg[widget.indexCatg]['nombre']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text(" Eliminar",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
        
         deleteCatg();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                '/pages/listCateg', (Route<dynamic> route) => false);
                  
              // Navigator.popAndPushNamed(context, '/pages/listCateg');
              // Navigator.of(context).pushNamedAndRemoveUntil('/pages/listCateg', (Route<dynamic> route) => false);
        },
      ),
       VerticalDivider(),
      new RaisedButton(
        child: new Text("CANCELAR",style: new TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog, barrierDismissible: false,);
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(title: new Text("Categoria - ${widget.listCatg[widget.indexCatg]['nombre']}"),
    
          actions: <Widget>[
          IconButton(icon: Icon(Icons.category , size: 40.0,color: Colors.red,),
           onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil('/pages/listCateg', (Route<dynamic> route) => false);
           }
           )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                  colors: [Colors.cyanAccent,Colors.white,Colors.blueAccent[400]])),
        child: SingleChildScrollView(
                child: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Card(
              child: new Center(
                child: new Column(
                  children: <Widget>[

                    new Padding(padding: const EdgeInsets.only(top: 10.0),),
                    new Text(widget.listCatg[widget.indexCatg]['nombre'], style: new TextStyle(fontSize: 20.0),),
                  
                    new Padding(padding: const EdgeInsets.only(top: 30.0),),
                        new Divider(),
                   new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                       new RaisedButton(
                        child: new Text("EDITAR"),                  
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0)),
                         onPressed: ()=>Navigator.of(context).push(
                            new MaterialPageRoute(
                         builder: (BuildContext context)=>new EditCateg(listCatg: widget.listCatg, indexCatg: widget.indexCatg,),
                            )
                          ),                    
                      ),   
                      VerticalDivider(),
                      new RaisedButton(
                        child: new Text("ELIMINAR"),                  
                        color: Colors.redAccent, 
                        shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: ()=>confirm(),                
                      ),
                      VerticalDivider(),
                /*          new RaisedButton(
                        child: new Text("Salir"),
                        color: Colors.yellow,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                        ),
                        onPressed: () {
                         Navigator.pushReplacementNamed(context, '/pages/list_product');
                      
                        },
                      ), */
                      ],
                    ) 
                  ],
/* ---------------Botones editar-elimanr salir------------- */




                ),
              ),
            ),
          ),
        ),
      ),
     
    );
  }
} 