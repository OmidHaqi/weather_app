import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return const Center(
      child: Text(
        'BookMarkScreen',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
