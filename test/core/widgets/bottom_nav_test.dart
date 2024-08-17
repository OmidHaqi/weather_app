import 'package:clean_arcitechture_edu/core/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'click IconButton in bottom nav shold moving to page in PageView',
    (tester) async {
      PageController pageController = PageController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNav(controller: pageController),
            body: PageView(
              controller: pageController,
              children: [
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      );
      await tester.tap(
        find.widgetWithIcon(IconButton, Icons.home),
      );
      //? rebuild
      await tester.pumpAndSettle();

      expect(pageController.page, 0);
    },
  );
  testWidgets(
    'click IconButton in bottom nav shold moving to page in PageView',
    (tester) async {
      PageController pageController = PageController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNav(controller: pageController),
            body: PageView(
              controller: pageController,
              children: [
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      );
      await tester.tap(
        find.widgetWithIcon(IconButton, Icons.bookmark),
      );
      //? rebuild
      await tester.pumpAndSettle();

      expect(pageController.page, 1);
    },
  );
}
