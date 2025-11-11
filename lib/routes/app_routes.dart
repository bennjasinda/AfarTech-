import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/account_screen.dart';
import '../screens/edit_profile_screen.dart'; // Nouveau
import '../screens/my_orders_screen.dart';   // Nouveau
import '../screens/notifications_screen.dart'; // Nouveau

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
      '/edit-profile': (context) => const EditProfileScreen(),
      '/my-orders': (context) => const MyOrdersScreen(),
      '/notifications': (context) => const NotificationsScreen(),
    };
  }
}