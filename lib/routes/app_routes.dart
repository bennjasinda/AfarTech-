// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/account_screen.dart';
import '../screens/edit_profile_screen.dart'; 
import '../screens/my_orders_screen.dart';   
import '../screens/notifications_screen.dart'; 
import '../screens/product_detail_screen.dart'; // Retirer 'hide ProductDetailScreen'

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => const LoginScreen(),
      '/login': (context) => const LoginScreen(),
      '/register': (context) => const RegisterScreen(),
      '/home-screen': (context) => const HomeScreen(),
      '/shop_screen': (context) => const ShopScreen(),
      '/cart_screen': (context) => const CartScreen(),
      '/favorites_screen': (context) => const FavoritesScreen(),
      '/account_screen': (context) => const AccountScreen(),

      // Nouvelles routes
      '/edit-profile': (context) => const EditProfileScreen(), // Corrigé
      '/my-orders': (context) => const MyOrdersScreen(),
      '/notifications': (context) => const NotificationsScreen(),

      // Route ajoutée pour ProductDetailScreen
      '/product-detail': (context) => const ProductDetailScreen(
        name: 'Default Product',
        price: 0.0,
        originalPrice: 0.0,
        discount: 0,
        rating: 0.0,
        reviewCount: 0,
        imageUrl: 'asset/default.png',
      ),
    };
  }
}