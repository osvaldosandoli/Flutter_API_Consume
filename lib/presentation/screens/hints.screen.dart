import 'package:aula13_checkpoint3/presentation/controller/car.controller.dart';
import 'package:aula13_checkpoint3/presentation/screens/register_hint.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HintsScreen extends StatefulWidget {
  const HintsScreen({super.key});

  @override
  State<HintsScreen> createState() => _HintsScreenState();
}

class _HintsScreenState extends State<HintsScreen> {
  late HintController _HintController;

  @override
  void initState() {
    _HintController = HintController();
    _HintController.fetchHints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Dicas")),
      body: Obx(() {
        if (_HintController.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_HintController.hints.value.isEmpty) {
          return const Center(
            child: Text('No Hints available'),
          );
        }

        return ListView.builder(
          itemCount: _HintController.hints.value.length,
          itemBuilder: (BuildContext context, int index) {
            final Hint = _HintController.hints.value[index];
            return ListTile(
              title: Text(Hint.student),
              subtitle: Text(Hint.title),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterHintScreen()),
            );
          }),
    );
  }
}
