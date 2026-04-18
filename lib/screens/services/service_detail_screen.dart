import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../contact/contact_screen.dart';
import '../review/review_screen.dart';
import '../payment/bkash_screen.dart';

class ServiceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceDetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text(service["name"]),
        backgroundColor: AppColors.primaryRed,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🏢 Service Header Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service["name"],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "by ${service["company"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ⭐ Rating + 💰 Price
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange),
                        Text("${service["rating"]}"),
                        const SizedBox(width: 10),
                        Text("(${service["reviews"]} reviews)"),
                        const Spacer(),
                        Text(
                          "৳ ${service["price"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 📝 Description
              sectionTitle("Description"),
              Text(
                service["desc"],
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // 📦 Features
              sectionTitle("What's Included"),
              ...List.generate(
                service["services"].length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 18),
                      const SizedBox(width: 8),
                      Text(service["services"][index]),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 📍 Availability
              sectionTitle("Availability"),
              Text(service["area"]),

              const SizedBox(height: 20),

              // ⏰ Service Time
              sectionTitle("Service Time"),
              Text(service["time"]),

              const SizedBox(height: 30),

              // 📞 Contact
              actionCard(
                icon: Icons.call,
                title: "Contact Service",
                color: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContactScreen(),
                    ),
                  );
                },
              ),

              // ⭐ Review
              actionCard(
                icon: Icons.star,
                title: "Give Review",
                color: Colors.orange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ReviewScreen(),
                    ),
                  );
                },
              ),

              // 💳 Payment
              actionCard(
                icon: Icons.payment,
                title: "Pay with bKash",
                color: Colors.pink,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BkashScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Section Title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔹 Action Card
  Widget actionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Text(title, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}