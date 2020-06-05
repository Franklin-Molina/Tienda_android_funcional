import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_tienda/pages/list_product.dart';
import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File imageFile;
 // TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerimagen = new TextEditingController();
  
    void addimg() {
    var url = "http://192.168.0.106/tienda/addimg.php";

    http.post(url, body: {
     
      "img": controllerimagen.text,
     
      
    });
  }

  _openGallery (BuildContext context) async {
    var  picture= await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var  picture= await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Seleccione"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Galeria"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0),),
                  GestureDetector(
                    child: Text("Camara"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
  //retorna  texto si no se ha seleccionado alguna imagen
  Widget _decideImageView(){
    if(imageFile==null){
      return Text("No se ha seleccionado una imagen");
    }
    else{
      return  Image.file(imageFile,width: 400, height: 250);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Acceso Camara/Galeria"),
      ),
    
                      
                  
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Selecciona la Imagen"),
              ),
                      new RaisedButton(
                        child: new Text('Guardar'),
                        color: Colors.red[100],
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                         onPressed: () {
                           print('guardar');
                                        addimg();
                                      
                                      },
                      ),
            ],
          ),
        ),
      
      ),
     
    );
  }
}