import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

class DbStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(ProductModel myproduct) {
    _firestore.collection(kProductsCollection).doc().set(myproduct.toMap());

    // .set({
    //   kProductName: myproduct.pName,
    //   kProductPrice: myproduct.pPrice,
    //   kProductcategory: myproduct.pCategory,
    //   kProductDescription: myproduct.pDescription,
    //   kProductimages: myproduct.pimage,
    //   kProductid:myproduct.pId,
    // });
  }

  Stream<QuerySnapshot> loadProduct() {
    return _firestore.collection(kProductsCollection).snapshots();
  }

  deletproduct(docId) {
    _firestore.collection(kProductsCollection).doc(docId).delete();
  }

  addUser(UserModel user) async {
    _firestore.collection(kUserCollection).doc(user.id).set(user.toMap());
  }
}
