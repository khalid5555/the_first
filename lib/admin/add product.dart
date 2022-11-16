import 'dart:io';
import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:the_first/widget%20screen/customtextfield.dart';

import '../constants.dart';
import '../db/db_store.dart';
import '../models/product_model.dart';

// import 'package:path/path.dart' as p;

class AddProduct extends StatefulWidget {
  static String id = 'addproduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _kyform = GlobalKey<FormState>();
  String? _name, _price, _description, _category, _id;

  final _mystore = DbStore();
  File? _myimage;
  String? _url;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('اضافة منتج جديد'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _kyform,
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(() {
                            _myimage = File(image!.path);
                          });
                        },
                        child: _displayChild1()),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onClick: (val) {
                    _name = val;
                  },
                  hint: ' اسم المنتج او الخدمة',
                  icon: Icons.topic_outlined,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onClick: (val) {
                    _price = val;
                  },
                  hint: "السعر",
                  keytyp: TextInputType.number,
                  icon: Icons.attach_money_outlined,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 20),
                    cursorColor: Colors.amber,
                    maxLines: 3,
                    onSaved: (newValue) {
                      _description = newValue!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.description,
                        color: kPrColor,
                      ),
                      filled: true,
                      hintText: 'ادخل الوصف',
                      hintStyle: const TextStyle(fontSize: 15),
                      fillColor: Colors.purple[100],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _selectCategory(),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    await uploadImage(context);
                    if (_kyform.currentState!.validate()) {
                      _kyform.currentState!.save();

                      try {
                        await _mystore.addProduct(
                          ProductModel(
                            upload: Timestamp.now(),
                            pName: _name!,
                            pPrice: _price!,
                            pimageurl: _url!,
                            pCategory: _category!,
                            pDescription: _description!,
                            pId: _id!,
                          ),
                        );

                        _kyform.currentState!.reset();
                        // Fluttertoast.showToast(msg: 'تم الاضافة بنجاح....');
                        setState(() {
                          _myimage = null;
                        });
                      } catch (e) {
                        // Fluttertoast.showToast(
                        //     msg: e.toString(), toastLength: Toast.LENGTH_LONG);
                      }
                    }
                  },
                  child: const Text(
                    'حفظ المنتج',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future uploadImage(context) async {
    int id = Random().nextInt(10000);

    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref('item_Pics').child('producspic $id.jpg');
      UploadTask storageUploadTask = ref.putFile(_myimage!);
      TaskSnapshot taskSnapshot = await storageUploadTask.whenComplete(
        () => const Text('success'),
      );

      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (ex) {
      // Fluttertoast.showToast(
      //     msg: ex.toString(), toastLength: Toast.LENGTH_LONG);
    }
  }

  // Widget _selectCategory() {
  //   return StreamBuilder(
  //     stream: FirebaseFirestore.instance.collection('services').snapshots(),
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) return Text('Error: ${snapshot.error}');
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.waiting:
  //           return new Text('Loading...');
  //         default:
  //           return DropdownButton<String>(
  //             onChanged: (String newValue) {
  //               if (newValue == 'Select Category') {
  //                 setState(() {
  //                   isError = true;
  //                 });
  //               } else {
  //                 setState(() {
  //                   selectedValue = newValue;
  //                   isError = false;
  //                 });
  //               }
  //             },
  //             value: selectedValue,
  //             items: snapshot.data.docs.map((DocumentSnapshot document) {
  //               return DropdownMenuItem<String>(
  //                 value: document['title'],
  //                 child: Text(document['title']),
  //               );
  //             }).toList(),
  //           );
  //       }
  //     },
  //   );
  // }
  Widget _displayChild1() {
    if (_myimage == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: const [
            Icon(
              Icons.camera_alt_sharp,
              color: Colors.black,
              size: 90,
            ),
            Text('اختار الصورة'),
          ],
        ),
      );
    } else {
      return Image.file(
        _myimage!,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _selectCategory() {
    var selected = ['مبيعاتنا', 'منتجاتنا'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DropdownButton(
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        isExpanded: false,
        hint: const Text(
          'اختار من الاقسام',
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
        items: selected
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
            .toList(),
        onChanged: (myvalue) {
          setState(() {
            _category = myvalue;
          });
        },
        value: _category!,
      ),
    );
  }
}
