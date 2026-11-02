import 'package:flutter_test/flutter_test.dart';
import 'package:ponsel_mart/main.dart';

void main() {
  testWidgets('Ponsel Mart menampilkan halaman login terlebih dahulu', (tester) async {
    await tester.pumpWidget(const PonselMartApp());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Selamat datang kembali!'), findsOneWidget);
    expect(find.text('Masuk ke akun'), findsOneWidget);
  });
}
