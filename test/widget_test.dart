import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protipo/main.dart';

void main() {
  testWidgets('Verifica se a tela de cadastro é exibida', (WidgetTester tester) async {
    // Constrói o app e faz o "pump"
    await tester.pumpWidget(MyApp());

    // Verifica se o título da AppBar é "Cadastro de Usuário"
    expect(find.text('Cadastro de Usuário'), findsOneWidget);

    // Verifica se o botão "Cadastrar" está presente
    expect(find.text('Cadastrar'), findsOneWidget);

    // Verifica se os campos de texto estão presentes (Nome, Email, Senha, Confirmar Senha)
    expect(find.byType(TextFormField), findsNWidgets(4));  // Deve ter 4 campos de texto

    // Você pode adicionar mais verificações aqui conforme necessário
  });
}
