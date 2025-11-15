import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/presentation/quotes_screen/controller/quotes_screen_controller.dart';
import 'package:riverpod_example/presentation/quotes_screen/state/quotes_screen_state.dart';

class QuotesScreen extends ConsumerStatefulWidget {
  const QuotesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<QuotesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(qoutesScreenProvider.notifier).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenState = ref.watch(qoutesScreenProvider);
    return Scaffold(
      body: screenState.isLoading! ? Center(child: CircularProgressIndicator(),):
      
       ListView.builder(
        itemCount: screenState.quotes!.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(screenState.quotes?[index].author.toString() ?? ""), subtitle: Text(screenState.quotes?[index].quote.toString() ?? "")),
      ),
    );
  }
}
