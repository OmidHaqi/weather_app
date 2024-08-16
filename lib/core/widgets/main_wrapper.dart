import 'package:clean_arcitechture_edu/core/widgets/app_background.dart';
import 'package:clean_arcitechture_edu/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:clean_arcitechture_edu/core/widgets/bottom_nav.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidgets = [const HomeScreen(), const BookmarkScreen()];
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNav(
          controller: pageController,
        ),
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AppBackground.getBackGroundImage(),
            fit: BoxFit.cover,
          )),
          child: PageView(
            physics: const AlwaysScrollableScrollPhysics()
                  .applyTo(const BouncingScrollPhysics()),
            controller: pageController,
            children: pageViewWidgets,
          ),
        ),
      ),
    );
  }
}
