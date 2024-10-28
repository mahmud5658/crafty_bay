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
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}