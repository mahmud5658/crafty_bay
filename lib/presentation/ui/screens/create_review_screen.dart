import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';


class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({
    super.key,
  });

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        backToHome();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Create Review'),
          leading: IconButton(
              onPressed: () {
                backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name'
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Write Review',
                  ),
                  maxLines: 8,
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: (){}, child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }


  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}


