import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => CounterProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Whole Screen Rebuilt");

    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Watch Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Static Text (But will rebuild)",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text(counter.count.toString(), style: const TextStyle(fontSize: 40)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
