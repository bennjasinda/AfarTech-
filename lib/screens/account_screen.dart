// lib/screens/account_screen.dart
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Empêche de fermer en cliquant en dehors
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
          title: const Text('Log Out'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                // Remplacez '/login' par votre route de déconnexion réelle
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Log Out', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2C3E50);
    final Color surfaceColor = const Color(0xFFF8F9FA);
    final Color dividerColor = Colors.grey.shade300;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Gérer le menu
          },
        ),
        title: Image.asset(
          'asset/logo.png', // Assurez-vous que le chemin est correct
          height: 30,
        ),
        centerTitle: true,
        
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: primaryColor, // Couleur des icônes et du titre
      ),
      body: Container(
        color: surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carte utilisateur
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 32,
                        child: const Text(
                          'JD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'john.doe@email.com',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Naviguer vers l'édition du profil
                          Navigator.pushNamed(context, '/edit-profile');
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Menu principal
              Expanded(
                child: ListView.separated(
                  itemCount: _getMenuItemCount(),
                  separatorBuilder: (_, __) => Divider(color: dividerColor, height: 1),
                  itemBuilder: (context, index) {
                    final item = _getMenuItem(index);
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(item['icon'], color: primaryColor),
                      ),
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (item['badge'] != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${item['badge']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade600),
                        ],
                      ),
                      onTap: () {
                        // Navigation vers la page correspondante
                        switch (index) {
                          case 0: // My Orders
                            Navigator.pushNamed(context, '/my-orders');
                            break;
                          case 1: // Notifications
                            Navigator.pushNamed(context, '/notifications');
                            break;
                          // Ajoutez d'autres cas si nécessaire
                        }
                      },
                    );
                  },
                ),
              ),
              // Bouton de déconnexion
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[50], // Léger fond rouge
                    foregroundColor: Colors.red, // Texte rouge
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.red.withOpacity(0.3)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout, size: 18),
                      SizedBox(width: 8),
                      Text('Logout', style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  int _getMenuItemCount() => _getMenuItems().length;

  List<Map<String, dynamic>> _getMenuItems() {
    return [
      {'title': 'My Orders', 'icon': Icons.shopping_bag, 'badge': 3},
      {'title': 'Notifications', 'icon': Icons.notifications, 'badge': 4},
    ];
  }

  Map<String, dynamic> _getMenuItem(int index) => _getMenuItems()[index];
}