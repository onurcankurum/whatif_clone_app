import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatif/painters/triangle.dart';
import 'dart:math' as math;
class CardMessage extends StatelessWidget {
  double fullHeigt;
   final double fullWidth;
  String text = '';
  bool isYa;

  CardMessage({required this.fullHeigt, required this.text,required this.isYa,required this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: double.infinity,
      height: (fullHeigt * 0.3),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          
          Expanded(
                      child: Card(
              elevation: 5,
                
                color: isYa?Colors.white:Colors.black,
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Center(
                  child: Column(
                    children: [
                      Text(
        this.isYa?'Belki':'Ama..',
        style: GoogleFonts.roboto(
              textStyle: TextStyle(color: isYa? Colors.black:Colors.white),
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
        ),
              
      ),SizedBox(height:10),
                      Text(
     
              text,
               textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(color: isYa? Colors.black: Colors.white),
                      fontSize: 30,
                
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
              ),
    ),


    
                    ],
                  ),
                ),
              ),
          ),Padding(
              padding: EdgeInsets.only(left:fullWidth*0.7),
              child: CustomPaint(
          
        painter: ShapesPainter(isYa? Colors.white: Colors.black),
        child: Container(
  
    height: 18,
    width: 25,
           )),
            )
          
        ],
      ),
    );
  }
}
