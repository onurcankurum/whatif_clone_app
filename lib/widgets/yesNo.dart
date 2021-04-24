import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatif/model/sorular.dart';

class YesNoButton extends StatefulWidget {
  Sorular currentSoru;
  Function soruGec;
  int lvl;
  YesNoButton({required this.currentSoru, required this.soruGec,required this.lvl});
  _YesNoButtonState createState() => _YesNoButtonState();
}

class _YesNoButtonState extends State<YesNoButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: isPressed
            ? GestureDetector(
                onTap: () {
                  isPressed = false;
                  widget.soruGec();
                },
                child: Row(children: [
                  Expanded(
                    flex: widget.currentSoru.evet,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffe51dba), Color(0xffd71e99)],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.mirror),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 3),
                      ),
                      height: 100,
                      child: Text(
                        '${widget.currentSoru.evet} kişi evet dedi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.fredokaOne(
                          textStyle: TextStyle(color: Colors.white),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:widget.currentSoru.evet,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff27ace3), Color(0xff0f82d3)],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.mirror),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 3),
                      ),
                      height: 100,
                      child: Text(
                        '${widget.currentSoru.hayir} kişi hayır dedi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.fredokaOne(
                          textStyle: TextStyle(color: Colors.black),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            : Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        widget.currentSoru.yes(widget.lvl);
                        setState(() {
                          isPressed = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffe51dba), Color(0xffd71e99)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.mirror),
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        height: 100,
                        child: Text(
                          'Evet!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.fredokaOne(
                            textStyle: TextStyle(color: Colors.white),
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        widget.currentSoru.no(widget.lvl);
                        setState(() {
                          isPressed = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff27ace3), Color(0xff0f82d3)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.mirror),
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3),
                        ),
                        height: 100,
                        child: Text(
                          'Hayır!(',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.fredokaOne(
                            textStyle: TextStyle(color: Colors.black),
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
