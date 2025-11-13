import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/presentation/Home_screen/controller/home_screen_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(homescreenProvider);
    return Scaffold(
      appBar: AppBar(title: Text(counterState.name!)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homescreenProvider.notifier).onIncrement();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counterState.count.toString()),
            IconButton(
              onPressed: () {
                ref.read(homescreenProvider.notifier).onDecrement();
              },
              icon: Icon(Icons.exposure_minus_1_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
