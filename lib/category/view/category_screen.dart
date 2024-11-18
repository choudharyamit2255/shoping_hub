import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_hub/category/provider/category_provider.dart';
import 'package:shoping_hub/category/view/category_details_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}
class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context,listen: false).fetchCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("Category Screen"),),
      body: Consumer<CategoryProvider>(builder: (context, categoryProvider,child){
        if(categoryProvider.categoryList.isEmpty){
          return Center(child: CircularProgressIndicator(),);
        }return ListView.builder(
          itemCount: categoryProvider.categoryList.length,
          itemBuilder: (context, index) {
          final category = categoryProvider.categoryList[index];
          return Card(child: ListTile(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return CategoryDetailsScreen(category: category,);
            }));
          },
            title: Text(category.name??"",style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(category.sId.toString()),
          ),);
        },);
      },)
    );
  }
}
