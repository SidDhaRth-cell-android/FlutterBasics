import 'package:flutter/material.dart';
import 'package:flutter09/vm/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("BUILD CALLED");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder:
                (BuildContext context, CounterProvider value, Widget? child) {
              return Text(value.counter.toString());
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().incrementCounter();
              },
              child: Text("Increment"))
        ],
      ),
    );
  }
}
