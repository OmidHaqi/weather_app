import 'package:clean_arcitechture_edu/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {

  test('Theme data is not null', () {
    expect(AppTheme.themeData(), isNotNull);
  });

  test('Brightness is set to dark', () {
    expect(AppTheme.themeData().brightness, equals(Brightness.dark));
  });
}
