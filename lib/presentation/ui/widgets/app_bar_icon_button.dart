
import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key, required this.onTap, required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.shade200,
        child: IconButton(onPressed: onTap, icon:  Icon(iconData,color: Colors.grey,size: 20,)));
  }
}