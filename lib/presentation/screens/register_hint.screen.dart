
import 'package:flutter/material.dart';
import '../controller/car.controller.dart';

class RegisterHintScreen extends StatefulWidget {
  const RegisterHintScreen({super.key});

  @override
  State<RegisterHintScreen> createState() => _RegisterHinScreenState();
}

class _RegisterHinScreenState extends State<RegisterHintScreen> {
  late HintController _hintController;
  final TextEditingController _chassiController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  void initState() {
    _hintController = HintController();
    super.initState();
  }

  _showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), duration: const Duration(seconds: 3));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _clear() {
    _chassiController.clear();
    _nameController.clear();
    _yearController.clear();
  }

  _onPressed() async {
    final result = await _hintController.createHint(
      category: _chassiController.text,
      title: _nameController.text,
      student: _yearController.text,
      description: _yearController.text,
    );

    if (result) {
      _showSnackBar("Dica cadastrado com sucesso!");
    } else {
      _showSnackBar("Falha ao cadastrar Dica!");
    }
    _clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Cadastro",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _chassiController,
              decoration: const InputDecoration(label: Text("informe a Categoria")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(label: Text("informe o titulo")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(label: Text("informe o nome ou RM")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _yearController,
              decoration: const InputDecoration(label: Text("informe a sua Dica")),
            ),
          ),
          ElevatedButton(onPressed: _onPressed, child: const Text("Salvar")),
        ],
      ),
    );
  }
}
