import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Services/database.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> favoritenewsData =
      FirebaseFirestore.instance.collection('cart').snapshots();
  deleteProduct(String id) {
    DataBase db = DataBase();
    db.deleteFromCart(id);
  }

  logOut() {
    FirebaseAuth instance = FirebaseAuth.instance;
    instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Cart"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: favoritenewsData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const Text("Loading..."));
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: const Text("Cart is Empty."));
          }

          return ListView(
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String id = document.id;

              return Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                  top: 20,
                  bottom: 16,
                ),
                child: Card(
                  elevation: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          data['image'],
                          height: 150,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              data["name"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_rounded,
                            ),
                          ),
                          PopupMenuButton(
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () {
                                    deleteProduct(id);
                                    Navigator.pop(context);
                                  },
                                  leading: const Padding(
                                    padding:
                                        EdgeInsets.only(right: 8.0, top: 5),
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Quantity: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${data["quantity"]}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            const Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "\$${data["price"]}",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
