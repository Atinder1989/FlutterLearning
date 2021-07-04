import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
 var products = <Product>[].obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
   await Future.delayed(Duration(seconds: 1));
   var productResult = [
      Product(
        id: 1,
        price: 30,
        productDescription: "Some Description about product",
        productImage: "abd",
        productName: "FirstProd"
      ),
     Product(
         id: 2,
         price: 40,
         productDescription: "Some Description about product",
         productImage: "abd",
         productName: "Second Product"
     ),
     Product(
         id: 1,
         price: 49.5,
         productDescription: "Some Description about product",
         productImage: "abd",
         productName: "Third Product"
     ),
   ];
   products.value = productResult;
  }

}