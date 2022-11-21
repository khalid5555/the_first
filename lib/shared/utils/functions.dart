import '../../models/product_model.dart';

List<ProductModel> getProductByCategory(
    String dd, List<ProductModel> allproducts) {
  List<ProductModel> products = [];
  try {
    for (var product in allproducts) {
      if (product.pCategory == 'مبيعاتنا') {
        products.add(product);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}
