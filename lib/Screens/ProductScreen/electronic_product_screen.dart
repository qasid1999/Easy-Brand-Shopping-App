import 'package:flutter/material.dart';
import 'package:shopping_app/CommonWidgets/items.dart';
import 'package:shopping_app/Screens/product_detail_screen.dart';

class ElectronicScreen extends StatefulWidget {
  const ElectronicScreen({Key? key}) : super(key: key);

  @override
  _ElectronicScreenState createState() => _ElectronicScreenState();
}

class _ElectronicScreenState extends State<ElectronicScreen> {
  List<Item> listofitem = [
    Item(
      image: "images/ElectronicsImages/electronics_imag1.png",
      name: "Iron",
      price: 110,
    ),
    Item(
      image: "images/ElectronicsImages/electronics_imag2.png",
      name: "Computer Mouse",
      price: 10,
    ),
    Item(
        image: "images/ElectronicsImages/electronics_imag5.png",
        name: "Coffe Machine",
        price: 400),
    Item(
        image: "images/ElectronicsImages/electronics_imag6.png",
        name: "Hand Free",
        price: 60),
    Item(
        image: "images/ElectronicsImages/electronics_imag4.png",
        name: "Mouse",
        price: 19),
    Item(
        image: "images/ElectronicsImages/electronics_imag7.png",
        name: "Head Phone",
        price: 100),
    Item(
        image: "images/ElectronicsImages/electronics_image8.png",
        name: "Energy Saver",
        price: 40),
    Item(
        image: "images/ElectronicsImages/electronics_image9.png",
        name: "Printer Machine",
        price: 500),
    Item(
        image: "images/ElectronicsImages/electronics_image10.png",
        name: "Calculator",
        price: 30),
    Item(
        image: "images/ElectronicsImages/electronics_image11.png",
        name: "Battery Cell",
        price: 5),
    Item(
        image: "images/ElectronicsImages/electronics_image12.png",
        name: "Shaver Machine",
        price: 100),
    Item(
        image: "images/ElectronicsImages/electronics_imag4.png",
        name: "Mouse",
        price: 80),
    Item(
        image: "images/ElectronicsImages/electronics_imag5.png",
        name: "Coffee Machine",
        price: 35),
    Item(
        image: "images/ElectronicsImages/electronics_imag1.png",
        name: "Iron",
        price: 100),
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
                    "Electronics Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1600,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listofitem.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProductDetail(
                                name: listofitem[index].name,
                                image: listofitem[index].image,
                                price: listofitem[index].price);
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
                                listofitem[index].image,
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                listofitem[index].name,
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
                                      "\$${listofitem[index].price}",
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
