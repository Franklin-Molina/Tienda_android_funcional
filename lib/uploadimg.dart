import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class CargaImg extends StatefulWidget {
  @override
  _CargaImgState createState() => _CargaImgState();
}

class _CargaImgState extends State<CargaImg> {
  File _image;
  TextEditingController nombreimg = new TextEditingController();



  Future getImageGallery() async{
    var imgeFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imgeFile;
    });
  }
   Future getImageCamera() async{
    var imgeFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = imgeFile;
    });
  }

  Future upload(File imgeFile) async{
    var stream= new http.ByteStream(DelegatingStream.typed(imgeFile.openRead()));
     var length= await imgeFile.length();
      var uri = Uri.parse("http://192.168.42.170/tienda/img.php");
  


    var request = new http.MultipartRequest("POST", uri);
    
    var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imgeFile.path)); 
   
    request.fields['nombre'] = nombreimg.text;
    request.files.add(multipartFile); 

    var response = await request.send();
    if(response.statusCode==200){
    print("Image Uploaded");
  }else{
    print("Upload Failed");
  }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imagen'),),
      body: Column(
        children: <Widget>[
          Center(
            child: _image == null
            ? new Text('NO hay image')
            : new Image.file(_image),
          ),
          TextField(
            controller: nombreimg,
            decoration:  new InputDecoration(
              hintText: 'Nombre',
            ),
          ),
          Row(children: <Widget>[
            RaisedButton(
              child: Icon(Icons.image),
              onPressed: getImageGallery,
            ),
               RaisedButton(
              child: Icon(Icons.camera),
              onPressed: getImageCamera,
            ),
                 RaisedButton(
                   child: Text('CargarImg'),
                   onPressed: (){
                     upload(_image);
                   },

            )
          ],)
        ],
      ),
    );
  }
}