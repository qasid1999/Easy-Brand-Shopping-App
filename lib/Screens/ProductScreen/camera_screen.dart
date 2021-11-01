import 'package:flutter/material.dart';
import 'package:shopping_app/CommonWidgets/items.dart';
import 'package:shopping_app/Screens/product_detail_screen.dart';

class CameraProductScreen extends StatefulWidget {
  const CameraProductScreen({Key? key}) : super(key: key);

  @override
  _CameraProductScreenState createState() => _CameraProductScreenState();
}

class _CameraProductScreenState extends State<CameraProductScreen> {
  Widget _buildText(String text) {
    return Container(
      margin: const EdgeInsets.only(
        left: 17,
        top: 16,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Card _buildExtraCategory(String text) {
    return Card(
      color: Colors.pink[200],
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  List<int> pricelist = [
    22,
    30,
    12,
    23,
    11,
  ];
  List<Item> listofitem = [
    Item(
      image: "images/camera_images/camera1.png",
      name: "DSLR Camera",
      price: 20,
    ),
    Item(
      image: "images/camera_images/camera2.png",
      name: "Canon Camera",
      price: 30,
    ),
    Item(
      image: "images/camera_images/camera3.png",
      name: "Canon Camera",
      price: 50,
    ),
    Item(
      image: "images/camera_images/camera4_image.jpg",
      name: "Sumsung Camera",
      price: 20,
    ),
    Item(
      image: "images/camera_images/camera5.png",
      name: "LG Camera",
      price: 400,
    ),
    Item(
      image: "images/camera_images/camera6.png",
      name: "Canon Camera",
      price: 400,
    ),
    Item(
      image: "images/camera_images/camera7.png",
      name: "DSLR Camera",
      price: 400,
    ),
  ];
  List<Item> hotDealitemList = [
    Item(
      image: "images/camera_images/camera1.png",
      name: "DSLR Camera",
      price: 20,
    ),
    Item(
      image: "images/camera_images/camera4.png",
      name: "Sumsung Camera",
      price: 20,
    ),
    Item(
      image: "images/camera_images/camera5.png",
      name: "LG Camera",
      price: 400,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var _crossAxisCount = 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Camera Products",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              _buildText("Item Discount"),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listofitem.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                          ),
                          elevation: 8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(
                                    16,
                                  ),
                                  topRight: Radius.circular(
                                    16,
                                  ),
                                ),
                                child: Image.asset(
                                  listofitem[index].image,
                                  height: 150,
                                  width: 180,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                listofitem[index].name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Price  \$ ${listofitem[index].price}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildText("Sub Category"),
              Container(
                padding: const EdgeInsets.all(
                  16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16,
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                ),
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 50),
                  children: [
                    _buildExtraCategory("Digital "),
                    _buildExtraCategory("Analog"),
                    _buildExtraCategory("CCTV"),
                    _buildExtraCategory("Drone"),
                    _buildExtraCategory("Handycam"),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              _buildText("Hot Deal"),
              Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16,
                    ),
                  ),
                ),
                height: 450,
                child: ListView.builder(
                  itemCount: hotDealitemList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                          ),
                          elevation: 8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(
                                    16,
                                  ),
                                  topRight: Radius.circular(
                                    16,
                                  ),
                                ),
                                child: Image.asset(
                                  hotDealitemList[index].image,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, bottom: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      hotDealitemList[index].name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Price  \$ ${hotDealitemList[index].price}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
