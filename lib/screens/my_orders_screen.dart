// lib/screens/my_orders_screen.dart
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2C3E50);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: const Center(
          child: Text('My Orders Screen'),
        ),
      ),
    );
  }
}