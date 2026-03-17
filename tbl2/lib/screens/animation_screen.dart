import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double largura = 120;
  double altura = 120;
  Color cor = Colors.blue;
  double opacidade = 0.0;

  void animarTela() {
    setState(() {
      largura = largura == 120 ? 220 : 120;
      altura = altura == 120 ? 220 : 120;
      cor = cor == Colors.blue ? Colors.green : Colors.blue;
      opacidade = opacidade == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atividade Final"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: largura,
              height: altura,
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: opacidade,
              child: const Text(
                "Texto aparecendo gradualmente",
                style: TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: animarTela,
              child: const Text("Animar"),
            ),
          ],
        ),
      ),
    );
  }
}