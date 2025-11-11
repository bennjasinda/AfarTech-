import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset(
          'asset/logo.png',
          height: 30,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/cart_screen');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Shop',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}