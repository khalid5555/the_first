import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/utils/app_theme.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

class DbStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(ProductModel myProduct) {
    _firestore.collection(kProductsCollection).doc().set(myProduct.toMap());
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
