 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(1),
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(Icons.person_outline),
                          ),
                          const SizedBox(width: 5,),
                          const Text("Abdullah Al mahmud",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                        child: Text("Simple is a scam. The application is full of mindless irrelevant questions.If they don’t refund my money immediately I’ll contact the Col Department of consumer fraud.",style: TextStyle(color: Colors.black54,fontSize: 16),),
                      )
                    ],
                  ),
                ),
              );
            }, separatorBuilder: (_,__)=>const SizedBox(height: 8,), itemCount: 10),
          ),
          _buildAddReview(),
        ],
      ),
    );
  }

  Container _buildAddReview() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reviews (1000)",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
            backgroundColor: AppColors.themeColor,
            onPressed: (){

            
          },child: Icon(Icons.add,color: Colors.white,),)
        ],
      ),
    );
  }
}
