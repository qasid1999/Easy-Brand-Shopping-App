import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shopping_app/CommonWidgets/eleveted_button.dart';
import 'package:shopping_app/Services/database.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);
  final String name;
  final String image;
  final double price;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  creattFavProduct({
    required String name,
    required String image,
    required double price,
  }) async {
    DataBase db = DataBase();
    await db.creatFavoriteProduct(
      name: name,
      image: image,
      price: price,
    );
  }

  addtocart({
    required String name,
    required String image,
    required double price,
    required int quantity,
  }) async {
    DataBase db = DataBase();
    await db.addtoCart(
      name: name,
      image: image,
      price: price,
      quantity: quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              widget.image,
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30,
                  ),
                  topRight: Radius.circular(
                    30,
                  ),
                ),
              ),
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          creattFavProduct(
                            name: widget.name,
                            image: widget.image,
                            price: widget.price,
                          );
                        },
                        icon: const Icon(
                          Icons.favorite_sharp,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Quantity",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              22,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  } else {
                                    quantity = 1;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
                            ),
                            Text("$quantity"),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity >= 1) {
                                    quantity++;
                                  } else {
                                    quantity = 1;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BuildButton(
                      onpressed: () {
                        addtocart(
                          name: widget.name,
                          image: widget.image,
                          price: widget.price,
                          quantity: quantity,
                        );
                      },
                      text: "Add to Cart")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
