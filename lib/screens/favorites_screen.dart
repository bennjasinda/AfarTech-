// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2C3E50);
    final Color surfaceColor = const Color(0xFFF8F9FA);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset(
          'asset/logo.png', // Assurez-vous que le chemin est correct
          height: 30,
        ),
        centerTitle: true,
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
      body: SafeArea(
        child: Container(
          color: surfaceColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Favorites',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                Text(
                  '3 saved products',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                    children: [
                      ProductCard(
                        name: 'Premium Wireless Headphones with Noise Reduction...',
                        price: 149.99,
                        originalPrice: 199.99,
                        discount: 25,
                        rating: 4.8,
                        reviewCount: 2341,
                        imageUrl: 'asset/headphone.png', // Assurez-vous que le chemin est correct
                        isFavorite: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                name: 'Premium Wireless Headphones with Noise Reduction...',
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
                      ),
                      ProductCard(
                        name: 'Portable Gaming PC 15.6" Intel i7 16GB RAM',
                        price: 1299.99,
                        originalPrice: 1599.99,
                        discount: 19,
                        rating: 4.7,
                        reviewCount: 1832,
                        imageUrl: 'asset/laptop.png',
                        isFavorite: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                name: 'Portable Gaming PC 15.6" Intel i7 16GB RAM',
                                price: 1299.99,
                                originalPrice: 1599.99,
                                discount: 19,
                                rating: 4.7,
                                reviewCount: 1832,
                                imageUrl: 'asset/laptop.png',
                              ),
                            ),
                          );
                        },
                      ),
                      ProductCard(
                        name: 'Smart Watch Blue',
                        price: 199.99,
                        originalPrice: 239.99,
                        discount: 17,
                        rating: 4.5,
                        reviewCount: 1200,
                        imageUrl: 'asset/watch.jpg',
                        isFavorite: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                name: 'Smart Watch Blue',
                                price: 199.99,
                                originalPrice: 239.99,
                                discount: 17,
                                rating: 4.5,
                                reviewCount: 1200,
                                imageUrl: 'asset/watch.jpg',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}