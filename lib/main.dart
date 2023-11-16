// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

ColorScheme carmesinColorScheme = ColorScheme.fromSwatch(
  primarySwatch: MaterialColor(0xFFDC143C, {
    50: Color(0xFFDC143C),
    100: Color(0xFFDC143C),
    200: Color(0xFFDC143C),
    300: Color(0xFFDC143C),
    400: Color(0xFFDC143C),
    500: Color(0xFFDC143C),
    600: Color(0xFFDC143C),
    700: Color(0xFFDC143C),
    800: Color(0xFFDC143C),
    900: Color(0xFFDC143C),
  }),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: carmesinColorScheme,
        useMaterial3: true,
      ),
      home: FormApp(),
    );
  }
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();

  // Novos controladores para os campos do carro
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _potenciaController = TextEditingController();
  final TextEditingController _versaoController = TextEditingController();
  final TextEditingController _aceleracaoController = TextEditingController();
  final TextEditingController _turboController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro do piloto e do carro'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Número'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _complementController,
              decoration: InputDecoration(labelText: 'Complemento'),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Cidade'),
            ),
            TextField(
              controller: _stateController,
              decoration: InputDecoration(labelText: 'Estado'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _siteController,
              decoration: InputDecoration(labelText: 'Site'),
            ),
            // Campos do carro
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: 'Modelo do Carro'),
            ),
            TextField(
              controller: _marcaController,
              decoration: InputDecoration(labelText: 'Marca do Carro'),
            ),
            TextField(
              controller: _anoController,
              decoration: InputDecoration(labelText: 'Ano do Carro'),
            ),
            TextField(
              controller: _potenciaController,
              decoration: InputDecoration(labelText: 'Potência do Carro'),
            ),
            TextField(
              controller: _versaoController,
              decoration: InputDecoration(labelText: 'Versão do Carro'),
            ),
            TextField(
              controller: _aceleracaoController,
              decoration: InputDecoration(labelText: 'Aceleração do Carro'),
            ),
            TextField(
              controller: _turboController,
              decoration:
                  InputDecoration(labelText: 'Possui Turbo? (true/false)'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _clearForm();
                  },
                  child: Text('Limpar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveForm();
                  },
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _recoverForm();
                  },
                  child: Text('Recuperar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _addressController.clear();
    _numberController.clear();
    _complementController.clear();
    _cityController.clear();
    _stateController.clear();
    _emailController.clear();
    _siteController.clear();

    // Limpar campos do carro
    _modeloController.clear();
    _marcaController.clear();
    _anoController.clear();
    _potenciaController.clear();
    _versaoController.clear();
    _aceleracaoController.clear();
    _turboController.clear();
  }

  void _saveForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('address', _addressController.text);
    prefs.setString('number', _numberController.text);
    prefs.setString('complement', _complementController.text);
    prefs.setString('city', _cityController.text);
    prefs.setString('state', _stateController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('site', _siteController.text);

    // Salvar campos do carro
    prefs.setString('modelo', _modeloController.text);
    prefs.setString('marca', _marcaController.text);
    prefs.setString('ano', _anoController.text);
    prefs.setString('potencia', _potenciaController.text);
    prefs.setString('versao', _versaoController.text);
    prefs.setString('aceleracao', _aceleracaoController.text);
    prefs.setBool('turbo', _turboController.text.toLowerCase() == 'true');
  }

  void _recoverForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('name') ?? '';
    _addressController.text = prefs.getString('address') ?? '';
    _numberController.text = prefs.getString('number') ?? '';
    _complementController.text = prefs.getString('complement') ?? '';
    _cityController.text = prefs.getString('city') ?? '';
    _stateController.text = prefs.getString('state') ?? '';
    _emailController.text = prefs.getString('email') ?? '';
    _siteController.text = prefs.getString('site') ?? '';

    // Recuperar campos do carro
    _modeloController.text = prefs.getString('modelo') ?? '';
    _marcaController.text = prefs.getString('marca') ?? '';
    _anoController.text = prefs.getString('ano') ?? '';
    _potenciaController.text = prefs.getString('potencia') ?? '';
    _versaoController.text = prefs.getString('versao') ?? '';
    _aceleracaoController.text = prefs.getString('aceleracao') ?? '';
    _turboController.text = prefs.getBool('turbo')?.toString() ?? '';
  }
}
