import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orilla_fresca/models/category.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => [..._categories];

  Future<void> getCategoriesFromFirestore() async {
    final snapshot = await _firestore.collection('data').doc('categories').get();
    var data = snapshot.data() as Map<String, dynamic>;
    var categoriesData = data['categories'] as List<dynamic>;
  }
}
