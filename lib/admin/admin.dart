import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:the_first/admin/add%20product.dart';
import 'package:the_first/admin/editproduct.dart';
import 'package:the_first/shared/utils/app_theme.dart';
import 'package:the_first/view/home_view.dart';
import 'package:the_first/view/products.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '...صفحة الادمن',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GFButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              size: GFSize.LARGE,
              textStyle: headingStyle,
              text: 'اضافة المنتج',
              type: GFButtonType.solid,
              shape: GFButtonShape.pills,
              onPressed: () {
                Get.to(() => const AddProduct());
              },
            ),
            GFButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              size: GFSize.LARGE,
              textStyle: headingStyle,
              text: ' التعديل علي المنتج',
              type: GFButtonType.solid,
              shape: GFButtonShape.pills,
              onPressed: () {
                Get.to(() => Editproduct());
              },
            ),
            GFButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              size: GFSize.LARGE,
              textStyle: headingStyle,
              text: 'كل المنتجات',
              type: GFButtonType.solid,
              shape: GFButtonShape.pills,
              onPressed: () {
                Get.to(() => const AllProducts());
              },
            ),
            GFButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              size: GFSize.LARGE,
              textStyle: headingStyle,
              text: 'الصفحة الرئيسية',
              type: GFButtonType.solid,
              shape: GFButtonShape.pills,
              onPressed: () {
                Get.to(() => const HomeView());
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget _loadScreen() {
  //   return ListView(
  //     children: <Widget>[
  //       ListTile(
  //         leading: Icon(Icons.add),
  //         title: Text("Add product"),
  //         onTap: () {},
  //       ),
  //       Divider(),
  //       ListTile(
  //         leading: Icon(Icons.change_history),
  //         title: Text("Products list"),
  //         onTap: () {},
  //       ),
  //       Divider(),
  //       ListTile(
  //         leading: Icon(Icons.add_circle),
  //         title: Text("Add category"),
  //         onTap: () {
  //           // _categoryAlert();
  //         },
  //       ),
  //       Divider(),
  //       ListTile(
  //         leading: Icon(Icons.category),
  //         title: Text("Category list"),
  //         onTap: () {},
  //       ),
  //       Divider(),
  //       ListTile(
  //         leading: Icon(Icons.add_circle_outline),
  //         title: Text("Add brand"),
  //         onTap: () {
  //           // _brandAlert();
  //         },
  //       ),
  //       Divider(),
  //       ListTile(
  //         leading: Icon(Icons.library_books),
  //         title: Text("brand list"),
  //         onTap: () {},
  //       ),
  //       Divider(),
  //     ],
  //   );
  // }

  // void _categoryAlert() {
  //   var alert = new AlertDialog(
  //     content: Form(
  //       key: _categoryFormKey,
  //       child: TextFormField(
  //         controller: categoryController,
  //         // ignore: missing_return
  //         validator: (value) {
  //           if (value.isEmpty) {
  //             return 'category cannot be empty';
  //           }
  //         },
  //         decoration: InputDecoration(hintText: "add category"),
  //       ),
  //     ),
  //     actions: <Widget>[
  //       FlatButton(
  //           onPressed: () {
  //             if (categoryController.text != null) {
  //               _categoryService.createCategory(categoryController.text);
  //             }
  //             Fluttertoast.showToast(msg: 'category created');
  //             Navigator.pop(context);
  //           },
  //           child: Text('ADD')),
  //       FlatButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text('CANCEL')),
  //     ],
  //   );

  //   showDialog(context: context, builder: (_) => alert);
  // }

//   void _brandAlert() {
//     var alert = new AlertDialog(
//       content: Form(
//         key: _brandFormKey,
//         child: TextFormField(
//           controller: brandController,
//           // ignore: missing_return
//           validator: (value) {
//             if (value.isEmpty) {
//               return 'category cannot be empty';
//             }
//           },
//           decoration: InputDecoration(hintText: "add brand"),
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//             onPressed: () {
//               if (brandController.text != null) {
//                 _brandService.createBrand(brandController.text);
//               }
//               Fluttertoast.showToast(msg: 'brand added');
//               Navigator.pop(context);
//             },
//             child: Text('ADD')),
//         FlatButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('CANCEL')),
//       ],
//     );

//     showDialog(context: context, builder: (_) => alert);
//   }
// }
}
