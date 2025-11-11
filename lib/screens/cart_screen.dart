import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Liste des produits dans le panier
  final List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    // Exemple de produits pour tester
    _cartItems.addAll([
      {
        'name': 'Smartphone 5G 128GB',
        'price': 699.99,
        'image': 'asset/phone.png',
        'quantity': 1,
      },
      {
        'name': 'Premium Wireless Headphones',
        'price': 149.99,
        'image': 'asset/headphone.png',
        'quantity': 2,
      },
    ]);
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    if (newQuantity < 1) {
      _removeItem(index);
      return;
    }
    setState(() {
      _cartItems[index]['quantity'] = newQuantity;
    });
  }

  double _getSubtotal() {
    double total = 0;
    for (final item in _cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = _getSubtotal();
    final shipping = 9.99;
    final total = subtotal + shipping;

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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart (${_cartItems.length})',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A2B4C)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _cartItems.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : ListView.separated(
                      itemCount: _cartItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = _cartItems[index];

                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Image.asset(
                                  item['image'] as String,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'] as String,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '\$${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey[300]!),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _updateQuantity(index, item['quantity'] - 1);
                                            },
                                            icon: const Icon(Icons.remove, size: 18),
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                                          ),
                                          Text('${item['quantity']}'),
                                          IconButton(
                                            onPressed: () {
                                              _updateQuantity(index, item['quantity'] + 1);
                                            },
                                            icon: const Icon(Icons.add, size: 18),
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () {
                                        _removeItem(index);
                                      },
                                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal'),
                        Text('\$${subtotal.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Shipping'),
                        Text('\$9.99'),
                      ],
                    ),
                    const Divider(height: 24, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Logique de commande
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2B4C),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}