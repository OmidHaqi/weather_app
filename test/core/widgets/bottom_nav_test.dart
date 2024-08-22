import 'package:clean_arcitechture_edu/core/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'tapping home icon in bottom nav should move to first page in PageView',
    (tester) async {
      final pageController = PageController();
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

      await tester.tap(find.widgetWithIcon(IconButton, Icons.home));
      await tester.pumpAndSettle();

      expect(pageController.page, 0);
    },
  );

  testWidgets(
    'tapping bookmark icon in bottom nav should move to second page in PageView',
    (tester) async {
      final pageController = PageController();
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

      await tester.tap(find.widgetWithIcon(IconButton, Icons.bookmark));
      await tester.pumpAndSettle();

      expect(pageController.page, 1);
    },
  );
}
