// import 'package:flutter_driver/driver_extension.dart';
// import 'package:flutter_viva_code/main.dart' as app;
//
// void main() {
//   enableFlutterDriverExtension();
//   app.main();
// }
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_viva_code/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_viva_code/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('reverse string test', (tester) async {
    // Build the widget
    await tester.pumpWidget(MyApp());

    // Wait for the widget tree to settle
    await tester.pumpAndSettle();

    // Find the TextField and the Reverse button
    var textField = find.byType(TextField);
    var button = find.text('Reverse');
    var reversedText = find.text('olleH'); // Make sure reversed text is visible

    // Interact with the app (enter text and tap the button)
    await tester.enterText(textField, 'Hello');
    await tester.tap(button);
    await tester.pumpAndSettle();

    // Now check that the reversed text is displayed
    expect(reversedText, findsOneWidget);
  });
}