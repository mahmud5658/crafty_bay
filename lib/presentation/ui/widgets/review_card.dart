import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
                Text(
                  'Abdullah Al Mahmud',
                  style:
                  Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade800),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '''It seems like you might be asking for a review on a topic. Could you clarify what you’d like a review on? Whether it's a specific concept, project, or something else, I’m here to help!''',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}