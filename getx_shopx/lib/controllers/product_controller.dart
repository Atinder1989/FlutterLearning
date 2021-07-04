import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_shopx/models/product.dart';
import 'package:getx_shopx/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      productList.value = products;
      print("count === ${products.length}");
    } finally {
      print("finally  ==== executed");
      isLoading(false);
    }
  }

}