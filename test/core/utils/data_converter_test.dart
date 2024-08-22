import 'package:clean_arcitechture_edu/core/utils/date_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('changeDtToDateTime test', () {
    test('should be return ---Aug 10---', () {
      var result = DateConverter.changeDtToDateTime(1660127867);
      expect(result, "Aug 10");
    });

    test('should be return ---Jan 27---', () {
      var result = DateConverter.changeDtToDateTime(16601278673);
      expect(result, "Jan 27");
    });

    test('should be return ---Apr 6---', () {
      var result = DateConverter.changeDtToDateTime(166012786);
      expect(result, "Apr 6");
    });
  });


  group('changeDtToTime test', () {
    test('should be return -- 10:39 --', () {
      var result = DateConverter.changeDtToTime(166012786);
      expect(result, "10:39");
    });

    test(' should be return -- 11:39 --', () {
      var result = DateConverter.changeDtToTime(166012786);
      expect(result, "10:39");
    });

    test(' should be return -- 00:16 PM --', () {
      var result = DateConverter.changeDtToTime(16601278611);
      expect(result, "10:16");
    });
  });
}
