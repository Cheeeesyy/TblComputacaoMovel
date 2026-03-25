import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Exercicio1 extends StatefulWidget {
  const Exercicio1({super.key});

  @override
  State<Exercicio1> createState() => _Exercicio1State();
}

class _Exercicio1State extends State<Exercicio1> {
  bool _ativo = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 200,
            height: _ativo ? 200 : 400,
            color: _ativo ? Colors.orange : Colors.green,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => setState(() => _ativo = !_ativo),
            child: const Text('Animar'),
          ),
        ],
      ),
    );
  }
}

class Exercicio2 extends StatefulWidget {
  const Exercicio2({super.key});

  @override
  State<Exercicio2> createState() => _Exercicio2State();
}

class _Exercicio2State extends State<Exercicio2> {
  bool _grande = false;

  void _animar() async {
    setState(() => _grande = true);
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => _grande = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _grande ? 140 : 90,
            height: _grande ? 140 : 90,
            alignment: Alignment.center,
            child: const FittedBox(
              child: Icon(
                Icons.face_6,
                size: 100,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _animar,
            child: const Text('Animar'),
          ),
        ],
      ),
    );
  }
}

class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});

  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  bool _visivel = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _visivel ? 1.0 : 0.0,
            child: const Text('Meu Pai!'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => setState(() => _visivel = !_visivel),
            child: const Text('Mostrar / Esconder'),
          ),
        ],
      ),
    );
  }
}

class Exercicio4 extends StatefulWidget {
  const Exercicio4({super.key});

  @override
  State<Exercicio4> createState() => _Exercicio4State();
}

class _Exercicio4State extends State<Exercicio4> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: _expandido ? 360 : 250,
            height: _expandido ? 260 : 160,
            child: Card(
              color: Colors.blue,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.description,
                      color: Colors.white,
                      size: 48,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Meu Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Card que expande',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => setState(() => _expandido = !_expandido),
            child: const Text('Expandir / Voltar'),
          ),
        ],
      ),
    );
  }
}

class Exercicio5 extends StatefulWidget {
  const Exercicio5({super.key});

  @override
  State<Exercicio5> createState() => _Exercicio5State();
}

class _Exercicio5State extends State<Exercicio5> {
  bool _ativo = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            width: _ativo ? 280 : 180,
            height: _ativo ? 280 : 180,
            decoration: BoxDecoration(
              color: _ativo ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 28),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: _ativo ? 1.0 : 0.0,
            child: const Text(
              'Texto aparecendo gradualmente',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: () => setState(() => _ativo = !_ativo),
            child: const Text('Animar'),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TBL 2'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Exercício 1'),
                Tab(text: 'Exercício 2'),
                Tab(text: 'Exercício 3'),
                Tab(text: 'Exercício 4'),
                Tab(text: 'Atividade Final'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Exercicio1()),
              Center(child: Exercicio2()),
              Center(child: Exercicio3()),
              Center(child: Exercicio4()),
              Center(child: Exercicio5()),
            ],
          ),
        ),
      ),
    );
  }
}