import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/presentation/Home_screen/controller/home_screen_controller.dart';
import 'package:riverpod_example/presentation/Home_screen/state/home_screen_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(homescreenProvider) as HomeScreenState;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homescreenProvider.notifier).onIncrement();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(counterState.count.toString())],
        ),
      ),
    );
  }
}
