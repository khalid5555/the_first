// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';

import '../db/db_store.dart';
import '../models/product_model.dart';
import '../shared/utils/app_colors.dart';
import '../shared/widgets/app_text_field.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _kyForm = GlobalKey<FormState>();
  String? _name, _price, _description, _category, _id;

  final _myStore = DbStore();
  File? _myImage;
  late String? _url;

  bool? isError;

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
            key: _kyForm,
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: _displayChild1(),
                  ),
                ),
                const SizedBox(height: 10),
                AppTextField(
                  onClick: (p0) {
                    setState(() {
                      p0 = _name;
                    });
                  },
                  hint: ' اسم المنتج او الخدمة',
                  icon: Icons.topic_outlined,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  onClick: (p1) {
                    setState(() {
                      p1 = _price;
                    });
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
                        color: AppColors.kPrColor,
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
                    const GFLoader(type: GFLoaderType.android);
                    await uploadImage(context);
                    if (_kyForm.currentState!.validate() || isError!) {
                      _kyForm.currentState!.save();

                      try {
                        await _myStore.addProduct(
                          ProductModel(
                            upload: Timestamp.now(),
                            pName: _name,
                            pPrice: _price,
                            pImageUrl: _url,
                            pCategory: _category,
                            pDescription: _description,
                          ),
                        );

                        _kyForm.currentState!.reset();
                        // Fluttertoast.showToast(msg: 'تم الاضافة بنجاح....');
                        setState(() {
                          _myImage = null;
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
    int id = Random().nextInt(100000000);

    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref('products').child('pic $id.jpg');
      UploadTask storageUploadTask = ref.putFile(_myImage!);
      TaskSnapshot taskSnapshot = await storageUploadTask.whenComplete(
        () {
          Get.snackbar('Hi', 'i am a modern snackbar');
        },
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
    if (_myImage == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: () async {
            final image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            setState(() {
              _myImage = File(image!.path);
            });
          },
          child: Column(
            children: [
              const Icon(
                Icons.camera_alt_sharp,
                color: Colors.black,
                size: 90,
              ),
              Text(
                'اختار الصورة',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      );
    } else {
      return Image.file(
        _myImage!,
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
        onChanged: (myValue) {
          if (myValue == 'اختار من الاقسام') {
            setState(() {
              isError = true;
            });
          } else {
            setState(() {
              _category = myValue;
              isError = false;
            });
          }
        },
        value: _category,
      ),
    );
  }
}
