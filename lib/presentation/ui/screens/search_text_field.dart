import 'package:flutter/material.dart';
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key, required this.searchController,
  });
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        border: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}