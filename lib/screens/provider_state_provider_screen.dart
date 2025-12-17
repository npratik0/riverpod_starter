import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// 1. Provider Ref: Provider -> Provider
// 2. Widget Ref: Provider -> Widget

// Create a provider - imutable
final appbarProvider = Provider<String>((ref) {
  return "Provider and StateProvider";
});

final definationProvider = Provider<String>((ref) {
  return "Provider is a popular, officially recommended package for state management that simplifies how data is shared and updated across the widget tree";
});

final definationStateProvider = Provider<String>((ref) {
  return "The StateProvider is a feature of the Riverpod state management package for Flutter, designed to manage and expose simple, mutable data types such as integers, strings, booleans, or enums.";
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class ProviderStateProviderScreen extends ConsumerWidget {
  const ProviderStateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(ref.read(appbarProvider)),
                    const SizedBox(width: 8),
                  ],
                ),
                // SizedBox(child: Column(
                //   children: [
                //     Text(ref.read(definationProvider)),
                //     const SizedBox(height: 8),
                //     Text(ref.read(definationStateProvider)),
                //   ],
                // ))
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(ref.read(definationProvider)),
                      const SizedBox(height: 8),
                      Text(ref.read(definationStateProvider)),
                      const SizedBox(height: 8),
                      const Text(
                        'Counter',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${ref.watch(counterProvider)}',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
              ref.read(counterProvider.notifier).state = 0;
            },
            backgroundColor: Colors.grey,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
