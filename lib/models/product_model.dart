// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? pName;
  String? pPrice;
  String? pDescription;
  String? pImageUrl;
  String? pCategory;
  String? pId;
  Timestamp? upload;
  ProductModel({
    this.pName,
    this.pPrice,
    this.pDescription,
    this.pImageUrl,
    this.pCategory,
    this.pId,
    this.upload,
  });

  Map<String, dynamic> toMap() {
    return {
      'pName': pName,
      'pPrice': pPrice,
      'pDescription': pDescription,
      'pimage': pImageUrl,
      'pCategory': pCategory,
      'pId': pId,
      'upload': upload,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      pName: map['pName'],
      pPrice: map['pPrice'],
      pDescription: map['pDescription'],
      pImageUrl: map['pimage'],
      pCategory: map['pCategory'],
      pId: map['pId'],
      upload: Timestamp.fromMillisecondsSinceEpoch(map['upload']),
    );
  }
}
