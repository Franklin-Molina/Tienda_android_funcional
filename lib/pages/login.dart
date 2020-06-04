import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tienda/main.dart';
import 'dart:convert';

import 'package:proyecto_tienda/pages/crear_cuenta.dart';

class LoginPage extends StatefulWidget {
  String username;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final titulo = TextStyle(color: Colors.black, fontSize: 15.0);
  //Nombra a la caja de texto y la instaciamos como new->
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = ''; //Alert
  Future<List> login() async {
    final response =
        await http.post("http://192.168.0.109/tienda/login.php", body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });
    print(controllerUser);
    print(controllerPass);

    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                title: Text(
                  "Credenciales Invalidas",
                  style: titulo,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Password / User ",
                      style: titulo,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      " Incorrect",
                      style: titulo,
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 73.0,
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Aceptar",
                      style: titulo,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      });
    } else {
      if (datauser[0]['estado'] == 'admin') {
        print('wellcome admin');

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.cyanAccent[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                title: Text(
                  "¡¡ Welcome !!",
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "¡¡ Administrador Binvenido !! ",
                      style: titulo,
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Icon(
                      Icons.fingerprint,
                      color: Colors.green,
                      size: 73.0,
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Aceptar",
                      style: titulo,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/powerPage');
                    },
                  ),
                ],
              );
            });
        //  Navigator.pushReplacementNamed(context, '/powerPage');
        // Navigator.pushReplacementNamed(context, '/porwePage');
      } else if (datauser[0]['estado'] == 'ventas') {
        print('wellcome Usuario');
        Navigator.pushReplacementNamed(context, '/pages/view_product');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: AppBar(title: Text("Login"),),

        body: Container(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/fondo1.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.only(top: 77.0),
                    child: new CircleAvatar(
                      child: new Image(
                          width: 100.0,
                          height: 100.0,
                          image: new AssetImage('assets/images/avatarx.png')),
                    ),
                    width: 170.0,
                    height: 170.0),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 93),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5),
                            ]),
                        child: TextFormField(
                          controller: controllerUser,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: 'User'),
                        ),
                      ),
                      //Password
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5),
                            ]),
                        child: TextFormField(
                          controller: controllerPass,
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                              hintText: 'Password'),
                        ),
                      ),
                      Spacer(),
                      new RaisedButton(
                        child: new Text('Ingresar'),
                        color: Colors.red[100],
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          login();
                          //   Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      new RaisedButton(
                        child: new Text('Crear cuenta'),
                        color: Colors.red,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new AddData()));
                        },
                      ),
                      Text(
                        mensaje,
                        style: TextStyle(fontSize: 1, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _alert(){

  
}