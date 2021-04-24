import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatif/model/sorular.dart';
import 'package:whatif/serbices/firebase.dart';
import 'package:whatif/widgets/card.dart';
import 'package:whatif/widgets/yesNo.dart';

class MAinScreen extends StatefulWidget {
  MAinScreen();

  @override
  _MAinScreenState createState() => _MAinScreenState();
}

class _MAinScreenState extends State<MAinScreen> {
  @override

  double _fullHeigt = 0;
  double _fullWidth = 0;
  List<Sorular> sorular = [];
  int lvl = 0;
  int inciSoru = 0;




  Future<void> getLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('lvl')) {
      this.lvl = prefs.getInt('lvl')!;
    }
  }
  Future<void> _getSorular() async {
    await getLevel();
    sorular = await Fireservice.getSorular(lvl);
  }

  void soruDegistir()async {
    if(sorular.length==inciSoru+1){
     lvl++;
     inciSoru=0;
final prefs = await SharedPreferences.getInstance();     setState(() {
      prefs.setInt('lvl', this.lvl);
     });
     return;
    }
    setState(() {
      inciSoru++;
    });
    
  }




  Widget build(BuildContext context) {

    this._fullHeigt = MediaQuery.of(context).size.height;
    this._fullWidth = MediaQuery.of(context).size.width;



   // final Map args = ModalRoute.of(context)!.settings.arguments as Map;
   // this._fullHeigt = args['fullHeigt'];
   // this._fullWidth = args['fullwidth'];
   // this.sorular = args['sorular'];

    //if (sorular.last == sorular[inciSoru]) {
    //  lvl++;
   //   Navigator.pushNamed(context, '/', arguments: {"lvl": this.lvl});
   // }
    return Padding(
      padding: EdgeInsets.only(right:0),
          child: Scaffold(

        backgroundColor: Color(0xfff05f0c),
        body:   FutureBuilder<void>(
            future: _getSorular(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (!sorular.isEmpty) {
     
                return Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: CardMessage(
                  fullHeigt: this._fullHeigt,
                  text: this.sorular[inciSoru].eger,
                  isYa: true,
                  fullWidth: this._fullWidth),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: CardMessage(
                  fullHeigt: this._fullHeigt,
                  text: this.sorular[inciSoru].ya,
                  isYa: false,
                  fullWidth: this._fullWidth),
            ),
            Text(
              'Ne Dersin ?',
              textAlign: TextAlign.center,
              style: GoogleFonts.fredokaOne(
                textStyle: TextStyle(color: Colors.black),
                fontSize: 40,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.only(bottom: 40),
                alignment: Alignment.bottomCenter,
                child: YesNoButton(
                    currentSoru: this.sorular[inciSoru], soruGec: soruDegistir,lvl:this.lvl)),
          ],
        );
                
               }else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child:Text('soru kalmadı agaaaaa ')),
                RaisedButton(
                onPressed: () => exit(0),
                child:Text('çıkış yap')),
                RaisedButton(onPressed: () async{
                
                 var prefs = await SharedPreferences.getInstance(); 
                 setState(() {
                 this.lvl=0;
                 prefs.setInt('lvl', this.lvl);
                 });},
                 child:Text('Baştan başla ve istatistiklerin içinden geç ^...^')

              
                
                ,)
                
                ] );
              }
              return Text('buraya kadar da gelmezdin');
              }
            ) 
      ),
    );
  }
}
