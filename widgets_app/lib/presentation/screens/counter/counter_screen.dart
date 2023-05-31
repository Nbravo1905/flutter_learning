import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter.provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int counterValue = ref.watch(counterProvider);
    final bool modeDark = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon( modeDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),

      body: Center(
        child: Text('Valor: $counterValue', style: Theme.of(context).textTheme.titleLarge),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {

          ref.read(counterProvider.notifier).state++;
          //ref.read(counterProvider.notifier).update((state) => state + 1);

        },
      ),

    );
  }
}