
import 'package:cloud_firestore/cloud_firestore.dart';

class Sorular {
  String eger='';
  String ya='';
  int  evet=0;
  String docId='';
  int hayir=0;
  int lvl=0;
  
  Sorular({required this.eger, required this.ya,required this.evet,required this.docId,required this.hayir});



  Sorular.fromJson(Map<String, dynamic> json,String id) {
    eger = json['eger'];
    ya = json['ya'];
    docId = id;
    hayir = json['hayir'];
    evet = json['evet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eger'] = this.eger;
    data['ya'] = this.ya;
    data['docId'] = this.docId;
    data['hayir'] = this.hayir;
    data['evet'] = this.evet;
    return data;
  }
    void yes(int lvl){
     final DocumentReference firestore =
      FirebaseFirestore.instance.collection('/soru$lvl').doc(docId);
     firestore.update({
        'evet': this.evet+1, // John Doe
      }).then((value) => print('başarılı'));
  }
     void no(int lvl){
     final DocumentReference firestore =
      FirebaseFirestore.instance.collection('/soru$lvl').doc(docId);
     firestore.update({
        'hayir': this.hayir+1, // John Doe
      }).then((value) => print('başarılı'));
  }
  }