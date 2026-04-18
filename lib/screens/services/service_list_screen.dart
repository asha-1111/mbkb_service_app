import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'service_detail_screen.dart';

class ServiceListScreen extends StatelessWidget {
  final String category;

  const ServiceListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    final Map<String, List<Map<String, dynamic>>> servicesData = {
      "Delivery": [
        {
          "name": "Fast Courier",
          "icon": Icons.local_shipping,
          "company": "MBKB Logistics",
          "desc":
          "Fast and reliable parcel delivery within Dhaka city. Safe handling and on-time delivery guaranteed.",
          "price": "100",
          "rating": "4.5",
          "reviews": "120",
          "area": "Dhaka, Chittagong",
          "time": "2-4 hours",
          "services": [
            "Same-day delivery",
            "Cash on delivery",
            "Live tracking"
          ]
        },
        {
          "name": "Food Delivery",
          "icon": Icons.fastfood,
          "company": "MBKB Food Service",
          "desc":
          "Get hot and fresh food delivered quickly from your favorite restaurants.",
          "price": "80",
          "rating": "4.3",
          "reviews": "95",
          "area": "Dhaka",
          "time": "30-60 minutes",
          "services": [
            "Restaurant delivery",
            "Live tracking",
            "Fast delivery"
          ]
        },
        {
          "name": "Bike Delivery",
          "icon": Icons.motorcycle,
          "company": "MBKB Logistics",
          "desc": "Small item delivery with fast bike service",
          "price": "60",
          "rating": "4.2",
          "reviews": "70",
          "area": "Dhaka",
          "time": "1-2 hours",
          "services": [
            "Quick delivery",
            "Affordable price",
            "Live tracking"
          ]
        },
      ],

      "Sales": [
        {
          "name": "Wholesale Supply",
          "icon": Icons.store,
          "company": "MBKB Sales Division",
          "desc":
          "Bulk product supply for businesses with affordable pricing.",
          "price": "500",
          "rating": "4.6",
          "reviews": "60",
          "area": "Nationwide",
          "time": "1-2 days",
          "services": [
            "Bulk purchase",
            "Discount pricing",
            "Nationwide delivery"
          ]
        },
      ],
    };

    final services = servicesData[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: AppColors.primaryRed,
      ),
      backgroundColor: Colors.grey[100],

      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),

              leading: CircleAvatar(
                backgroundColor: AppColors.primaryRed,
                child: Icon(
                  service["icon"],
                  color: AppColors.gold,
                ),
              ),

              title: Text(
                service["name"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text(service["desc"]),

              trailing: const Icon(Icons.arrow_forward),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ServiceDetailScreen(service: service),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}