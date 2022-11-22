import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_first/auth/auth_controller.dart';

import '../shared/utils/app_colors.dart';
import '../shared/utils/app_theme.dart';
import '../db/auth.dart';
import '../db/db_store.dart';
import '../shared/utils/functions.dart';
import '../models/product_model.dart';
import '../shared/widgets/productView.dart';
import 'product_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _auth = Auth();
  AuthController controller = Get.find();
  late User _loggedUser;
  int _tabBarIndex = 0;
  // int _bottomBarIndex = 0;
  final _store = DbStore();
  List<ProductModel>? _myProducts = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 4,
          child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: AppColors.kbiColor,
              buttonBackgroundColor: Colors.transparent,
              height: 50,
              items: <Widget>[
                Column(
                  children: const [
                    Icon(
                      Icons.home,
                      size: 40.0,
                      color: Colors.redAccent,
                    ),
                    Text('منتجاتنا'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.chat_bubble,
                      size: 40.0,
                      color: Colors.redAccent,
                    ),
                    Text('مبيعاتنا'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: 30.0,
                      color: Colors.redAccent,
                    ),
                    Text('الموقع'),
                  ],
                ),
                InkWell(
                  onTap: () => Get.snackbar(
                    'متفارقناش',
                    'اذا اردت الخروج اضغط مرتين',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent,
                  ),
                  onDoubleTap: controller.signOut,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.directions_bike,
                        size: 40.0,
                        color: Colors.redAccent,
                      ),
                      Text('الخروج'),
                    ],
                  ),
                ),
              ],
            ),
            // BottomNavigationBar(
            //   type: BottomNavigationBarType.fixed,
            //   unselectedItemColor: kUnActiveColor,
            //   currentIndex: _bottomBarIndex,
            //   fixedColor: kMainColor,
            //   onTap: (value) async {
            //     if (value == 2) {
            //       SharedPreferences pref =
            //           await SharedPreferences.getInstance();
            //       pref.clear();
            //       await _auth.signOut();
            //       Navigator.popAndPushNamed(context, 'loginscreen.id');
            //     }
            //     setState(() {
            //       _bottomBarIndex = value;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(
            //         // ignore: deprecated_member_use
            //         title: Text('منتجاتنا'),
            //         icon: Icon(Icons.person)),
            //     BottomNavigationBarItem(
            //         // ignore: deprecated_member_use
            //         title: Text('مبيعاتنا'),
            //         icon: Icon(Icons.phone_android)),
            //     BottomNavigationBarItem(
            //         // ignore: deprecated_member_use
            //         title: Text('الخروج'),
            //         icon: Icon(Icons.settings_backup_restore_outlined)),
            //   ],
            // ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: AppColors.kPrColor,
                onTap: (value) {
                  setState(() {
                    _tabBarIndex = value;
                  });
                },
                tabs: <Widget>[
                  Text(
                    'Jackets',
                    style: TextStyle(
                      color: _tabBarIndex == 0
                          ? Colors.black
                          : AppColors.kUnActiveColor,
                      fontSize: _tabBarIndex == 0 ? 17 : null,
                    ),
                  ),
                  Text(
                    'Trouser',
                    style: TextStyle(
                      color: _tabBarIndex == 1
                          ? Colors.black
                          : AppColors.kUnActiveColor,
                      fontSize: _tabBarIndex == 1 ? 18 : null,
                    ),
                  ),
                  Text(
                    'T-shirts',
                    style: TextStyle(
                      color: _tabBarIndex == 2
                          ? Colors.black
                          : AppColors.kUnActiveColor,
                      fontSize: _tabBarIndex == 2 ? 18 : null,
                    ),
                  ),
                  Text(
                    'Shoes',
                    style: TextStyle(
                      color: _tabBarIndex == 3
                          ? Colors.black
                          : AppColors.kUnActiveColor,
                      fontSize: _tabBarIndex == 3 ? 18 : null,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                jacketView(),
                productsView('منتجاتنا', _myProducts!),
                productsView(kShoes, _myProducts!),
                productsView(kTshirts, _myProducts!),
              ],
            ),
          ),
        ),
        Material(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'The First',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, CartScreen.id);
                      },
                      child: const Icon(Icons.shopping_cart))
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.height * .18,
          child: SizedBox(
            height: Get.height * .3,
            width: Get.width,
            // child: Carousel(
            //   showIndicator: true,
            //   dotBgColor: Colors.transparent,
            //   indicatorBgPadding: 0,
            //   animationCurve: Curves.easeInOutQuart,
            //   dotIncreasedColor: kPrColor,
            //   images: [
            //     Image.asset(
            //       "assets/images/m1.png",
            //       fit: BoxFit.fill,
            //     ),
            //     Image.asset(
            //       "assets/images/m2.png",
            //       fit: BoxFit.fill,
            //     ),
            //     const ExactAssetImage("assets/images/logo.gif")
            //   ],
            // ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrenUser();
  }

  getCurrenUser() async {
    _loggedUser = await _auth.getUser();
  }

  Widget jacketView() {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = [];
          for (var doc in snapshot.data!.docs) {
            var data = doc.data();
            //   products.add(
            //     // ProductModel.fromMap(data),
            //     // ProductModel(
            //     //   pId: doc.id,
            //     //   pPrice: data[kProductPrice],
            //     //   pName: data[kProductName],
            //     //   pDescription: data[kProductDescription],
            //     //   pimageurl: data[kProductimages],
            //     //   pCategory: data[kProductcategory], upload: null,
            //     // ),
            //   );
          }
          _myProducts = products;
          products.clear();
          products = getProductByCategory('منتجاتنا', _myProducts!);
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
            ),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductInfo.id,
                      arguments: products[index]);
                },
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_myProducts![index].pImageUrl!),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .6,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _myProducts![index].pName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('\$ ${_myProducts![index].pPrice}')
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            itemCount: products.length,
          );
        } else {
          return const Center(child: Text('Loading...'));
        }
      },
    );
  }
}

void updatelogin() async {
  // SharedPreferences prfs = await SharedPreferences.getInstance();
  GetStorage prfs = GetStorage();
  prfs.write('login', false);
  // prfs.setBool('seen', true);
}

// Widget bottnbar(){
// return  bottomNavigationBar: CurvedNavigationBar(
//         color: Colors.transparent,
//         backgroundColor: Colors.transparent,
//         buttonBackgroundColor: Colors.white,
//         height: 70.0,
//         items: <Widget>[
//           Icon(
//             Icons.home,
//             size: 40.0,
//             color: Colors.redAccent,
//           ),
//           Icon(
//             Icons.chat_bubble,
//             size: 40.0,
//             color: Colors.redAccent,
//           ),
//           Icon(
//             Icons.directions_bike,
//             size: 40.0,
//             color: Colors.redAccent,
//           ),
//           Icon(
//             Icons.location_on,
//             size: 30.0,
//             color: Colors.redAccent,
//           ),
//         ],
//       );
// }
