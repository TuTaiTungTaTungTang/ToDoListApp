import 'package:ct484_project/ui/products/user_products_screen.dart';
import 'package:flutter/material.dart';
import 'ui/products/products_manager.dart';
import 'ui/products/product_detail_screen.dart';
import 'ui/products/products_overview_screen.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      secondary: Colors.deepOrange,
      surface: Colors.white,
      surfaceTint: Colors.grey[200]);

     final themeData = ThemeData(
      fontFamily: 'Lato', 
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shadowColor: colorScheme.shadow
      ),
     ) ;

     return MaterialApp(
      title: 'MyShop',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      
      home: const SafeArea(
      child: ProductsOverviewScreen(),
      ),
     );
  }
}