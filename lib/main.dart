import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuário',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';
  String _senha = '';
  String _confirmacaoSenha = '';
  bool _cadastroRealizado = false;

  String? _validarNome(String? value) {
    if (value == null || value.length < 6) {
      return 'O nome deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? _validarEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Insira um email válido';
    }
    return null;
  }

  String? _validarSenha(String? value) {
    if (value == null || value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? _validarConfirmacaoSenha(String? value) {
    if (value != _senha) {
      return 'As senhas não correspondem';
    }
    return null;
  }

  void _tentarCadastrar() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _cadastroRealizado = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Campo Nome
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: _validarNome,
                  onChanged: (value) {
                    setState(() {
                      _nome = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                // Campo Email
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validarEmail,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                // Campo Senha
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                  validator: _validarSenha,
                  onChanged: (value) {
                    setState(() {
                      _senha = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                // Campo Confirmar Senha
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                  validator: _validarConfirmacaoSenha,
                  onChanged: (value) {
                    setState(() {
                      _confirmacaoSenha = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                // Botão Cadastrar
                ElevatedButton(
                  onPressed: _tentarCadastrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Botão vermelho
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Texto branco
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Exibição de Mensagem de Sucesso
                if (_cadastroRealizado)
                  Text(
                    'Cadastro realizado com sucesso!',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
