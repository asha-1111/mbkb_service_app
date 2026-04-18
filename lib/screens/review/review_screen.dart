import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  int rating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Reviews"),
        backgroundColor: AppColors.primaryRed,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🏢 Service Info
            const Text(
              "Fast Courier",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("by MBKB Logistics"),

            const SizedBox(height: 20),

            // ⭐ Star Rating
            const Text(
              "Your Rating",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: index < rating ? Colors.orange : Colors.grey,
                  ),
                );
              }),
            ),

            const SizedBox(height: 10),

            // 📝 Review Box
            TextField(
              controller: reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write your review...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🚀 Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Review Submitted")),
                  );
                },
                child: const Text("Submit Review"),
              ),
            ),

            const SizedBox(height: 25),

            // 📋 Previous Reviews
            const Text(
              "User Reviews",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            reviewCard("Rahim", 4, "Very fast delivery!"),
            reviewCard("Karim", 5, "Excellent service!"),
            reviewCard("Ayesha", 3, "Good but can improve."),
          ],
        ),
      ),
    );
  }

  // 🔹 Review Card
  Widget reviewCard(String name, int rating, String comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Row(
            children: List.generate(
              rating,
                  (index) => const Icon(Icons.star,
                  size: 16, color: Colors.orange),
            ),
          ),

          const SizedBox(height: 5),
          Text(comment),
        ],
      ),
    );
  }
}