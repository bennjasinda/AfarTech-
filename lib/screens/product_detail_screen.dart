import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final double price;
  final double originalPrice;
  final int discount;
  final double rating;
  final int reviewCount;
  final String imageUrl;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              height: 300,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(height: 20),

        
          Text(
            name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${originalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '-$discount%',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

       
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow[700], size: 20),
              const SizedBox(width: 4),
              Text(
                '$rating ($reviewCount reviews)',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 30),

      
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added "$name" to cart!'),
                    action: SnackBarAction(
                      label: 'View Cart',
                      onPressed: () {
                      
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A2B4C),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ),
          const SizedBox(height: 30),

     
          const Text(
            'Comments',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              final comments = [
                {'user': 'Alice', 'text': 'Great product! Very comfortable to wear.', 'date': 'Oct 5, 2025'},
                {'user': 'Bob', 'text': 'Good sound quality, battery lasts long.', 'date': 'Oct 3, 2025'},
                {'user': 'Charlie', 'text': 'Worth the price!', 'date': 'Oct 1, 2025'},
              ];
              final comment = comments[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Text(comment['user']![0]),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment['user']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  comment['date']!,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(comment['text']!),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 30),

          const Text(
            'Add a Comment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Write your comment here...',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Comment sent!')),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}