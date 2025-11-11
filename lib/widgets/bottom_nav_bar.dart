import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF1A2B4C),
      unselectedItemColor: Colors.grey[600],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
      
      onTap: (index) {
        String routeName;
        switch (index) {
          case 0:
            routeName = '/home-screen';
            break;
          case 1:
            routeName = '/shop_screen';
            break;
          case 2:
            routeName = '/cart_screen';
            break;
          case 3:
            routeName = '/favorites_screen';
            break;
          case 4:
            routeName = '/account_screen';
            break;
          default:
            routeName = '/'; 
        }
       
        if (ModalRoute.of(context)?.settings.name != routeName) {
          Navigator.pushNamed(context, routeName);
        }
      },
    );
  }
}