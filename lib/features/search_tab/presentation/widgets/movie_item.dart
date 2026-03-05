import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final TextEditingController controller;
  const SearchItem({required this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return
        TextField(
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          controller: controller,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search,
              color: Colors.white,
            ),
            hintText: "Search",
            hintStyle: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color:Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white)),
          ),
        );


    }

  }

