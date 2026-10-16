import 'package:flutter_test/flutter_test.dart';
import 'package:chulcut/main.dart';

void main() {
  testWidgets('ChulCut app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ChulCutApp());

    expect(find.text('ChulCut'), findsOneWidget);
  });
}
