import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_viva_code/main.dart';

void main() {
  test('string should be reverse', () {
    String initial = "hello";
    String reverse = reverseString(initial);
    expect(reverse, 'olleh');
  });
}