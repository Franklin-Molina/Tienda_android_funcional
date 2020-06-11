import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/editProduct.dart';
import 'package:http/http.dart' as http;

class DetalProduct extends StatefulWidget {
  List listPrd;
  int indexProd;
  DetalProduct({this.indexProd, this.listPrd});
  @override
  _DetalProductState createState() => new _DetalProductState();
}

class _DetalProductState extends State<DetalProduct> {

  //File _image;





  void deletProduct() {
    var url = "http://192.168.0.106/tienda/deletProduct.php";
    http.post(url, body: {'id': widget.listPrd[widget.indexProd]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Esta seguro de eliminar '${widget.listPrd[widget.indexProd]['nombre']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            " Eliminar",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
             deletProduct();
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/pages/list_product', (Route<dynamic> route) => false);
            /*  Navigator.of(context).popAndPushNamed( '/pages/list_product');
                 return  deletProduct(); */
          },
        ),
        VerticalDivider(),
        new RaisedButton(
          child:
              new Text("CANCELAR", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(
      context: context,
      child: alertDialog,
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.listPrd[widget.indexProd]['nombre']}",textAlign: TextAlign.center,),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                size: 40.0,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/pages/list_product', (Route<dynamic> route) => false);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                  ),
                  new Text('Detalles Producto'),
                  Divider(
                    color: Colors.red,
                  ),
                  new Text(
                    widget.listPrd[widget.indexProd]['nombre'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  new Text(
                    "Precio : ${widget.listPrd[widget.indexProd]['precio']}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  Divider(),
                  new Text(
                    "Categoria : ${widget.listPrd[widget.indexProd]['id_catg_producto']}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  Divider(),
                  new Text(
                    "Descipcion : ${widget.listPrd[widget.indexProd]['descripcion']}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  Divider(),
                    new Text(
                    "Foto : ${widget.listPrd[widget.indexProd]['img']}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  Divider(),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),


                  
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /* new RaisedButton(
                        child: new Text("EDITAR"),
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditDetalles(
                            list: widget.listPrd,
                            index: widget.indexProd,
                          ),
                        )),
                      ), */
                  
                      VerticalDivider(),
                      new MaterialButton(
                        height: 40,
                        minWidth: 200,
                        
                        child: new Text("ELIMINAR",style: TextStyle(color: Colors.white),),
                        color: Colors.redAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () => confirm(),
                      ),
                      /*   VerticalDivider(),
                       new RaisedButton(
                      child: new Text("Salir"),
                      color: Colors.yellow,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      onPressed: () {
                       Navigator.pushReplacementNamed(context, '/pages/list_product');
                    
                      },
                    ),*/
                    ],
                  )
                ],
/* ---------------Botones editar-elimanr salir------------- */
              ),
            ),
          ),
        ),
      ),
    );
    
  }



  
    /*Widget _mostrarFoto() {
    if (imageUrl != null) {
      return FadeInImage(
        image: NetworkImage(imageUrl),
        placeholder: AssetImage('assets/loading.gif'),
        fit: BoxFit.cover,
      );
    } else {
      //usamos un operador ternario para cambiar de widget en caso de no seleccionar imagen
      return Image(
        image: (_image?.path == null)
            ? AssetImage('assets/no-image.png')
            : FileImage(
                _image), //AssetImage(_image?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }*/

}
