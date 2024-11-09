import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';
import '../../utils/app_colors.dart';
import '../widgets/review_card.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({
    super.key,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
          title: const Text('Reviews'),
          leading: IconButton(
              onPressed: () {
                backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const ReviewCard();
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: 10)),
            Container(
              child: _buildAddReviewSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddReviewSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(.2),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reviews (1000)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: AppColors.themeColor,
            foregroundColor: Colors.white,
            onPressed: () {
              Get.to(()=> const CreateReviewScreen());
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}


