import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eye_defect_classification/main.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Load the TFLite model before running the tests
    const MethodChannel('tflite_flutter').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'loadModel') {
        return true;
      }
      return null;
    });
  });

  testWidgets('Eye Defect Classification App Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController controller) {
            controller.loadUrl('asset:///assets/eye_defect.html');
          },
        ),
      ),
    );

    // Wait for the model to load.
    await tester.pumpAndSettle();

    // Example: Test the WebView functionality.
    // You can add more verification or interaction steps as needed for your specific app functionality.

    // Example: Verify the AppBar title.
    expect(find.text('Eye Defect Classification'), findsOneWidget);
  });
}
