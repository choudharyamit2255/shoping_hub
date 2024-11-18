import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:shoping_hub/category/model/category_model.dart';
import 'package:shoping_hub/core/api_endpoint.dart';

class CategoryService {
  Future<List<Category>> fetchCategory() async {
    String url = ApiEndpoint.getCategory;
    final response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if(response.statusCode==200){

      final maplist = jsonDecode(response.body);
      List<Category> categoryList = [];
      for (int a=0;a<maplist.length;a++){
        final map = maplist[a];
        Category category = Category.fromJson(map);
        categoryList.add(category);
      }
      return categoryList;
    }else{
      throw 'Unavailable Category';
    }
  }
}
