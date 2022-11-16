import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import '../db/category.dart';
// import '../db/brand.dart';

class Admin extends StatefulWidget {
  static String id = 'admin';
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              // color: Colors.greenAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('addproduct.id');
              },
              child: const Text(
                'اضافة المنتج',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('editproduct.id');
              },
              child: const Text(
                'التعديل علي المنتج',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('productshow.id');
              },
              child: const Text(
                'كل المنتجات',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('HomePage.id');
              },
              child: const Text(
                ' home',
                style: TextStyle(fontSize: 20),
              ),
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
