import 'package:flutter/material.dart';

class CustomerReviewScreen extends StatefulWidget {
  const CustomerReviewScreen({super.key});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _reviewController,
                maxLines: 7,
                decoration: const InputDecoration(hintText: "Write review"),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: _moveToNextScreen, child: const Text("Next"))
            ],
          ),
        ),
      ),
    );
  }

  void _moveToNextScreen() {}
}
