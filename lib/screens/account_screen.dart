import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

 
  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
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
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login'); 
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            
          },
        ),
        title: Image.asset(
          'asset/logo.png', 
          height: 30,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
            
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFF1A2B4C),
                      radius: 28,
                      child: const Text(
                        'JD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'john.doe@email.com', 
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
          
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _getMenuItemCount(),
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = _getMenuItem(index);
                  return ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['title']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item['badge'] != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A2B4C),
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
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                    onTap: () {
                      // Navigation vers la page correspondante
                      switch (index) {
                        case 0: // My Orders
                          Navigator.pushNamed(context, '/my-orders');
                          break;
                        case 1: // Edit Profile
                          Navigator.pushNamed(context, '/edit-profile');
                          break;
                        case 2: // Notifications
                          Navigator.pushNamed(context, '/notifications');
                          break;
                      }
                    },
                  );
                },
              ),
            ),
         
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout, size: 18),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  int _getMenuItemCount() {
    return _getMenuItems().length;
  }

  List<Map<String, dynamic>> _getMenuItems() {
    return [
      {'title': 'My Orders', 'icon': Icons.shopping_bag, 'badge': 3},
      {'title': 'Edit Profile', 'icon': Icons.edit, 'badge': null},
      {'title': 'Notifications', 'icon': Icons.notifications, 'badge': 4},
    ];
  }

  Map<String, dynamic> _getMenuItem(int index) {
    return _getMenuItems()[index]; 
  }
}