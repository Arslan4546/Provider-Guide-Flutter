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
    print("Whole Screen Built Once");

    return Scaffold(
      appBar: AppBar(title: const Text("Consumer Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Static Text (Will NOT rebuild)",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),

          Consumer<CounterProvider>(
            builder: (context, counter, child) {
              print("Only Counter Text Rebuilt");
              return Text(
                counter.count.toString(),
                style: const TextStyle(fontSize: 40),
              );
            },
          ),
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
