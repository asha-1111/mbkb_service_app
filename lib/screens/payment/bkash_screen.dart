import 'package:flutter/material.dart';

class BkashScreen extends StatefulWidget {
  const BkashScreen({super.key});

  @override
  State<BkashScreen> createState() => _BkashScreenState();
}

class _BkashScreenState extends State<BkashScreen> {
  int selectedAmount = 500;
  bool isLoading = false;

  void makePayment() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // fake loading

    setState(() {
      isLoading = false;
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Payment Successful"),
        content: Text("Paid ৳$selectedAmount successfully!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  Widget amountButton(int amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedAmount == amount ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "৳$amount",
          style: TextStyle(
            color: selectedAmount == amount ? Colors.pink : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2136E),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2136E),
        elevation: 0,
        title: const Text("bKash Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🔷 Logo Style Circle
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet,
                color: Colors.pink,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Pay with bKash",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // 💰 Dynamic Amount Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                amountButton(100),
                amountButton(500),
                amountButton(1000),
              ],
            ),

            const SizedBox(height: 30),

            // 📱 Number
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "bKash Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔒 PIN
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "PIN",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 💸 Pay Button with Loading
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: makePayment,
              child: Text(
                "Pay ৳$selectedAmount",
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}