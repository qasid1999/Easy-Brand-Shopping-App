import 'package:flutter/material.dart';
import 'package:shopping_app/CommonWidgets/items.dart';

import '../product_detail_screen.dart';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({Key? key}) : super(key: key);

  @override
  _LaptopScreenState createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  List<Item> laptopItemList = [
    Item(
      image: "images/LaptopImages/hp_laptop_image1.png",
      name: "HP Core i7",
      price: 900,
    ),
    Item(
      image: "images/LaptopImages/hp_laptop_image2.png",
      name: "HP Core i5",
      price: 300,
    ),
    Item(
        image: "images/LaptopImages/hp_laptop_image6.png",
        name: "Dell Core i7",
        price: 400),
    Item(
        image: "images/LaptopImages/hp_laptop_image4.png",
        name: "Dell core i5",
        price: 800),
    Item(
        image: "images/LaptopImages/hp_laptop_image5.png",
        name: "Accer Core i5",
        price: 500),
    Item(
        image: "images/LaptopImages/hp_laptop_image6.png",
        name: "Lenovoe Core i7",
        price: 1000),
    Item(
        image: "images/LaptopImages/hp_laptop_image7.png",
        name: "Hp Core i6",
        price: 550),
    Item(
      image: "images/LaptopImages/hp_laptop_image8.png",
      name: "Sumsung Core i7",
      price: 1000,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  height: 50,
                  width: 320,
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 150,
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Laptops",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 900,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: laptopItemList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProductDetail(
                                name: laptopItemList[index].name,
                                image: laptopItemList[index].image,
                                price: laptopItemList[index].price);
                          }));
                        },
                        child: Card(
                          color: Colors.pink[50],
                          elevation: 20,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                laptopItemList[index].image,
                                height: 100,
                                width: 150,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                laptopItemList[index].name,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "\$${laptopItemList[index].price}",
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
