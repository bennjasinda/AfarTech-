// lib/screens/shop_screen.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

import '../widgets/product_card.dart'; 
import 'product_detail_screen.dart'; 

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2C3E50);
    final Color surfaceColor = const Color(0xFFF8F9FA);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset(
          'asset/logo.png', // Assurez-vous que le chemin est correct
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
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        color: surfaceColor,
        child: Column( // Structure principale en colonne
          children: [
            SizedBox( // Espacement en haut
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ProductCard(
                      name: 'Premium Wireless Headphones',
                      price: 149.99,
                      originalPrice: 199.99,
                      discount: 25,
                      rating: 4.8,
                      reviewCount: 2341,
                      imageUrl: 'asset/headphone.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              name: 'Premium Wireless Headphones',
                              price: 149.99,
                              originalPrice: 199.99,
                              discount: 25,
                              rating: 4.8,
                              reviewCount: 2341,
                              imageUrl: 'asset/headphone.png',
                            ),
                          ),
                        );
                      },
                    );
                  } else if (index == 1) {
                    // ✅ CORRIGÉ : Utilisation de ProductDetailScreen au lieu de EditProfileScreen
                    return ProductCard(
                      name: '5G Smartphone Latest',
                      price: 1299.99,
                      originalPrice: 1599.99,
                      discount: 22,
                      rating: 4.7,
                      reviewCount: 1832,
                      imageUrl: 'asset/phone.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen( // ✅ ICI
                              name: '5G Smartphone Latest',
                              price: 1299.99,
                              originalPrice: 1599.99,
                              discount: 22,
                              rating: 4.7,
                              reviewCount: 1832,
                              imageUrl: 'asset/phone.png',
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
                itemExtent: 200,
              ),
            ),
            // Vous pouvez ajouter d'autres widgets ici si nécessaire
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}