import 'package:blurbox/blurbox.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;
  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: BlurBox(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        // color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            const SizedBox(),
            IconButton(
              onPressed: () {
                controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
