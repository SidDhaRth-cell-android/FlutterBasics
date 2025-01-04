import 'package:flutter/material.dart';
import 'package:flutter09/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Random extends StatelessWidget {
  const Random({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
          builder:
              (BuildContext context, CounterProvider value, Widget? child) {
                print("Called");
            return Text(
              "${value.counter}",
              style: TextStyle(color: Colors.blue, fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrement();
            },
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
