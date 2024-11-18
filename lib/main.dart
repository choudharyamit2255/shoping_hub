


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_hub/auth/provider/auth_provider.dart';
import 'package:shoping_hub/auth/service/auth_service.dart';
import 'package:shoping_hub/auth/view/login_screen.dart';
import 'package:shoping_hub/category/provider/category_provider.dart';
import 'package:shoping_hub/category/service/category_service.dart';
import 'package:shoping_hub/dashboard/provider/dashboard_provider.dart';
import 'package:shoping_hub/product/provider/product_provider.dart';
import 'package:shoping_hub/product/service/product_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (build)=>AuthProvider(AuthService())),
        ChangeNotifierProvider(create: (context){
          return DashboardProvider();}),
        ChangeNotifierProvider(create: (context){
          return ProductProvider(ProductService());}),
        ChangeNotifierProvider(create: (context){
          return CategoryProvider(CategoryService());}),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
