import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  creatFavoriteProduct({
    required String name,
    required String image,
    required double price,
  }) async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    instance.collection("Fav_product").add(
      {
        "name": name,
        "image": image,
        "price": price,
      },
    );
  }

  deleteFromDataBase(String id) {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    instance.collection("Fav_product").doc(id).delete();
  }

  addtoCart(
      {required String name,
      required String image,
      required double price,
      required int quantity}) async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    instance.collection("cart").add(
      {
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
      },
    );
  }

  deleteFromCart(String id) {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    instance.collection("cart").doc(id).delete();
  }
}
