import 'package:blurbox/blurbox.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DotLoadingWidget extends StatelessWidget {
  const DotLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlurBox(
        blur: 10,
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(8),
        child: LoadingAnimationWidget.halfTriangleDot(
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
