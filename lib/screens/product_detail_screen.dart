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
    final primaryColor = const Color(0xFF2C3E50); // Couleur Register
    final dangerColor = const Color(0xFFE74C3C); // couleur du -%
    final secondaryColor = const Color(0xFF0096FF); // bleu moderne
    final surfaceColor = const Color(0xFFF5F7FA);
    final textColorPrimary = const Color(0xFF1A2B4C);
    final textColorSecondary = const Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ---------------- IMAGE ----------------
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            /// ---------------- TITLE ----------------
            Text(
              name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColorPrimary,
              ),
            ),
            const SizedBox(height: 8),

            /// ---------------- PRICE ----------------
            Row(
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "\$${originalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: textColorSecondary,
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: dangerColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "-$discount%",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// ---------------- RATING ----------------
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 22),
                const SizedBox(width: 4),
                Text(
                  "$rating ($reviewCount reviews)",
                  style: TextStyle(color: textColorSecondary),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// ---------------- DESCRIPTION ----------------
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColorPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "This is a high-quality product designed to give you the best performance.",
              style: TextStyle(color: textColorSecondary, fontSize: 15),
            ),
            const SizedBox(height: 24),

            /// ---------------- PHONE FIELD ----------------
            TextFormField(
              decoration: InputDecoration(
                labelText: 'phone number ',
                prefixIcon: Icon(Icons.phone, color: primaryColor),
                hintText: '555 555 555 ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: surfaceColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                labelStyle: TextStyle(color: primaryColor.withOpacity(0.7)),
              ),
            ), // ✔ FIXED
            const SizedBox(height: 16),

            /// ---------------- BUTTON ADD TO CART ----------------
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/cart_screen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // ✔ même style Register
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // ✔ cohérent Register
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// ---------------- REVIEWS SECTION ----------------
            Text(
              "Write a Review",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColorPrimary,
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write your review...",
                filled: true,
                fillColor: surfaceColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // ✔ même style Register
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Submit Review",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
