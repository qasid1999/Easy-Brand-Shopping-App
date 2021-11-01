import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/Screens/AuthScreens/lognin_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/camera_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/car_product_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/electronic_product_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/laptop_product_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/men_fashion_product_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/mobile_product_screen.dart';
import 'package:shopping_app/Screens/ProductScreen/women_fashion_product_screen.dart';
import 'package:shopping_app/Screens/cart_screen.dart';
import 'package:shopping_app/Screens/favorite_product_screen.dart';
import 'package:shopping_app/Screens/profile_screen.dart';

class HomScreen extends StatefulWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  _HomScreenState createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {
  final List<String> sliderImagelist = [
    "images/slider_image1.jpg",
    "images/slider_image3.jpg",
    "images/slider_image5.jpg",
  ];
  List categoryName = [
    "Camera",
    "Electronics",
    "Mobile",
    "Laptop",
    "Car",
    "Men's Fashion",
    "Women's Fashion",
  ];
  List categoryImageList = [
    "images/CategoriesImages/camera_image.png",
    "images/CategoriesImages/electronics_image.png",
    "images/CategoriesImages/mobile_image.png",
    "images/CategoriesImages/laptop_image.png",
    "images/CategoriesImages/car_image.png",
    "images/CategoriesImages/mens_fashion_image.png",
    "images/CategoriesImages/women_fashion_image.png",
  ];

  List popularCategoryName = [
    "Camera",
    "Electronics",
    "Mobile",
    "Laptop",
  ];
  List popularCategoriesClass = [
    const CameraProductScreen(),
    const ElectronicScreen(),
    const MobileProductScreen(),
    const LaptopScreen(),
  ];

  List listofCaterogriesClasses = [
    const CameraProductScreen(),
    const ElectronicScreen(),
    const MobileProductScreen(),
    const LaptopScreen(),
    const CarProductScreen(),
    const MenFashionProductScreen(),
    const WomenFashionProductScreen(),
  ];
  List popularCategoryList = [
    "images/CategoriesImages/camera_image.png",
    "images/CategoriesImages/electronics_image.png",
    "images/CategoriesImages/mobile_image.png",
    "images/CategoriesImages/laptop_image.png",
  ];
  int _current = 0;
  CarouselSlider buildSlider(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, __) {
          setState(
            () {
              _current = index;
            },
          );
        },
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: sliderImagelist
          .map(
            (item) => Image.asset(
              item,
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          )
          .toList(),
    );
  }

  List classNameList = [
    const HomScreen(),
    Cart(),
    FavoriteProductScreen(),
  ];
  int _selectedindex = 0;
  BottomNavigationBar _buildBottomNavigationBarr() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedindex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey[600],
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 20),
      onTap: (int index) {
        FirebaseAuth auth = FirebaseAuth.instance;
        setState(() {
          _selectedindex = index;
          if (auth.currentUser == null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LogInScreen();
            }));
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return classNameList[index];
                },
              ),
            );
          }
          _selectedindex = 0;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "My Order",
          icon: Icon(Icons.production_quantity_limits),
        ),
        BottomNavigationBarItem(
          label: "Favorite",
          icon: Icon(Icons.favorite),
        ),
      ],
    );
  }

  Drawer buildmenuBar(
    BuildContext context,
  ) {
    return Drawer(
      elevation: 50,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFF1D1E50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Easy Brand",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              return Navigator.pop(context);
            },
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {
              signout();
            },
            leading: Icon(Icons.logout),
            title: Text('Sign out'),
          ),
          ListTile(
            onTap: () {
              return Navigator.pop(context);
            },
            leading: Icon(Icons.settings),
            title: Text('Setting'),
          ),
          ListTile(
            onTap: () {
              /*if ( FirebaseAuth.instance.currentUser != null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileScreen(
                    user: FirebaseAuth.instance.currentUser!,
                  );
                }));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LogInScreen();
                }));
              }*/
            },
            leading: Icon(
              Icons.person_pin,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }

  signout() {
    FirebaseAuth instance = FirebaseAuth.instance;
    instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LogInScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildmenuBar(context),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Easy Brand Shopping App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBarr(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  bottom: 5,
                  top: 40,
                ),
                child: Text(
                  "Popular Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 3,
                  bottom: 8,
                  left: 3,
                ),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: popularCategoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          final classofCategory = popularCategoriesClass[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return classofCategory;
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Card(
                              margin: const EdgeInsets.all(5),
                              elevation: 20,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16,
                                  ),
                                ),
                              ),
                              child: Image.asset(
                                popularCategoryList[index],
                                height: 140,
                                width: 140,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              popularCategoryName[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  buildSlider(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sliderImagelist.map(
                      (image) {
                        int index = sliderImagelist.indexOf(image);
                        return Container(
                          width: 12.0,
                          height: 8.0,
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _current == index ? Colors.grey : Colors.white,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 50.0,
                  left: 20,
                ),
                child: Text(
                  "Catergories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        22,
                      ),
                    ),
                  ),
                  height: 900,
                  width: 500,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryImageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          final classofCategory =
                              listofCaterogriesClasses[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return classofCategory;
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Card(
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 20,
                                bottom: 15,
                              ),
                              elevation: 20,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16,
                                  ),
                                ),
                              ),
                              color: Colors.pink[50],
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.asset(
                                  categoryImageList[index],
                                  height: 150,
                                  width: 200,
                                ),
                              ),
                            ),
                            Text(
                              categoryName[index],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
