import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../services/service_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String searchText = "";

  final categories = [
    {"name": "Delivery", "icon": Icons.local_shipping},
    {"name": "Sales", "icon": Icons.shopping_cart},
  ];

  final allServices = [
    "Fast Courier",
    "Food Delivery",
    "Bike Delivery",
    "Wholesale Supply",
    "Retail Support",
    "Online Sales",
  ];

  @override
  Widget build(BuildContext context) {

    final filtered = allServices
        .where((s) => s.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: AppColors.primaryRed,
        title: const Text("MBKB Service App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔍 Search
            TextField(
              decoration: InputDecoration(
                hintText: "Search service...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // 🔎 Search Result OR Categories
            Expanded(
              child: searchText.isNotEmpty
                  ? ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filtered[index]),
                    leading: const Icon(Icons.search),
                  );
                },
              )
                  : GridView.builder(
                itemCount: categories.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ServiceListScreen(
                            category:
                            categories[index]["name"] as String,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryRed,
                            AppColors.lightRed,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index]["icon"] as IconData,
                            size: 50,
                            color: AppColors.gold,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            categories[index]["name"] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}