import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createCategory(String name) {
    // var id = Uuid();
    // String categoryId = id.v4();

    _firestore.collection('categories').doc().set({'category': name});
  }
}
