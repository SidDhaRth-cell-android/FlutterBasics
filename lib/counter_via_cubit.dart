import 'package:flutter/material.dart';
import 'package:flutter09/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterViaCubit extends StatelessWidget {
  const CounterViaCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>(); // Access Cubit
    print("Called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            // Wrap ONLY the Counter Text in BlocBuilder
            BlocBuilder<CounterCubit, int>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: counterCubit.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: counterCubit.decrement,
            child: const Icon(Icons.remove),
          ),
         /* const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: counterCubit.reset,
            child: const Icon(Icons.refresh),
          ),*/
        ],
      ),
    );
  }
}
