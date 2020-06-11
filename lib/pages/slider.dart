import 'package:flutter/material.dart';

import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:proyecto_tienda/pages/login.dart';



class IntroScreen extends StatefulWidget {
 
  
 

  @override
  _IntroScreenState createState() => _IntroScreenState();
}



class _IntroScreenState extends State<IntroScreen> {

 
  List<Slide> slides = new List();


  @override
  void initState() {
    super.initState();
      
     
    

    //pages slide
    slides.add(
      new Slide(
        title:
            "Mercado Libre",
        maxLineTitle: 2,
        styleTitle:
            TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description:
            "App movil donde puedes crear tus propios productos  ",
        styleDescription:
            TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("Deslice para pasar siguiente pantalla", style: TextStyle(color: Colors.white)),
        backgroundImage:  'assets/images/slider1.gif',
        onCenterItemPress: () {},
      ),
    );
    //two
    slides.add(
      new Slide(
        title: "Productos",
        styleTitle:
            TextStyle(color: Colors.yellow[300], fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Puedes ingresar cualquir clase de productos para poderlos vender",
        styleDescription:
            TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
          backgroundImage:  'assets/images/slider2.gif',
      ),
    );
    //three page
    slides.add(
      new Slide(
        title: "Todo puede ser posible",
        styleTitle:
            TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description:
            "Estamos listos para inicar",
        styleDescription:
            TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
          backgroundImage:  'assets/images/slider3.jpg',     
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() { 
   Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.greenAccent,
      highlightColorSkipBtn: Colors.red,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.blueAccent,
      highlightColorDoneBtn: Color(0xfF69303),

      // Dot indicator
      colorDot: Colors.white,
      colorActiveDot: Colors.orangeAccent[200],
      sizeDot: 13.0,

      // Show or hide status bar
      shouldHideStatusBar: false,
     //backgroundColorAllSlides: Colors.red,
    );
  }
}
