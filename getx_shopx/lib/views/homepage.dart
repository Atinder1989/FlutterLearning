import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:getx_shopx/controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: Text(
                  "ShopX",
                 style: TextStyle(
                   fontFamily: 'avenir',
                   fontSize: 32,
                   fontWeight: FontWeight.w900
                 ),
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.view_list_rounded)),
                 IconButton(onPressed: (){}, icon: Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(child: Obx(() =>
          _productController.isLoading.value ? Center(child: CircularProgressIndicator(),) :  _getStaggeredGridView()
          ))
        ],
      ),
    );
  }

  StaggeredGridView _getStaggeredGridView() {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: _productController.productList.length,
        mainAxisSpacing: 16,
        crossAxisSpacing: 10,
        itemBuilder: (context, index){
          return Container(
            height: 200,
            width: 100,
            color: Colors.lime,
            child: Text( _productController.productList[index].name),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1));
  }

}


