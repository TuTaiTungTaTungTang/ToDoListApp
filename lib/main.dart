import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'ui/products/products_manager.dart';
import 'ui/products/product_detail_screen.dart';
import 'ui/products/products_overview_screen.dart';
import 'ui/orders/orders_screen.dart';
>>>>>>> 46a20945eda24a0b7d7b5a6a01389c2d073d318c

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: 'ToDo App',
      home: MyApp(),
    );
=======
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
        shadowColor: colorScheme.shadow,
        elevation: 4,
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 20,
        ),
      ),
    );

    return MaterialApp(
      title: 'MyShop',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const ProductsOverviewScreen(),
      routes: {
        CartScreen.routeName: (ctx) => const SafeArea(
              child: CartScreen(),
            ),
        OrdersScreen.routeName: (ctx) => const SafeArea(
              child: OrdersScreen(),
            ),
        UserProductsScreen.routeName: (ctx) => const SafeArea(
              child: UserProductsScreen(),
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return SafeArea(
                child: ProductDetailScreen(
                  ProductsManager().findById(productId)!,
                ),
              );
            },
          );
        }
        return null;
      },
    );
>>>>>>> 46a20945eda24a0b7d7b5a6a01389c2d073d318c
  }
}
