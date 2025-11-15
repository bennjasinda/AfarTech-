// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'product_detail_screen.dart';
import 'shop_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: primaryColor,
      ),
      body: Container(
        color: surfaceColor,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('asset/banner.jpg'), // Assurez-vous que le chemin est correct
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Discover Our Offers',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'The best tech products',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShopScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: const Text('Explore', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      icon: Icons.smartphone,
                      label: 'Smartphones',
                      color: Colors.blue[50]!,
                    ),
                    const SizedBox(width: 16),
                    CategoryCard(
                      icon: Icons.laptop,
                      label: 'Laptops',
                      color: Colors.purple[50]!,
                    ),
                    const SizedBox(width: 16),
                    CategoryCard(
                      icon: Icons.headphones,
                      label: 'Audio',
                      color: Colors.orange[50]!,
                    ),
                    const SizedBox(width: 16),
                    CategoryCard(
                      icon: Icons.watch,
                      label: 'Wearables',
                      color: Colors.green[50]!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShopScreen()),
                      );
                    },
                    child: Text('See All >', style: TextStyle(color: primaryColor)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}