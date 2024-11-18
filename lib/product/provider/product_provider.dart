import 'package:flutter/foundation.dart';
import 'package:shoping_hub/product/model/product_model.dart';
import 'package:shoping_hub/product/service/product_service.dart';


class ProductProvider extends ChangeNotifier{
  List<Product> productList = [];
  ProductService productService;
  String? errorMessage;
  ProductProvider(this.productService);
  Future fetchProduct()async{
    try{
      productList = await productService.fetchProducts();
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}