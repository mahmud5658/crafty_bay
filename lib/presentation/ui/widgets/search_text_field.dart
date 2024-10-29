import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key, required this.searchEditingController,
  });
  final TextEditingController searchEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchEditingController,
      decoration: InputDecoration(
        contentPadding:const  EdgeInsets.symmetric(horizontal: 16),
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder: const  OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder:  const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}