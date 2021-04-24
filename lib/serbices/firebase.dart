import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatif/model/sorular.dart';

class Fireservice{


      
static Future <List<Sorular>> getSorular(int lvl) async {

   CollectionReference firestore =
      FirebaseFirestore.instance.collection('/soru$lvl');



  List<Sorular> sorular = [];
  await firestore.get()
    .then((quetySnapshot) {
      quetySnapshot.docs.forEach((doc) {
      sorular.add(Sorular.fromJson(doc.data(),doc.id));
    });
  });
return sorular;
}




}