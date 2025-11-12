import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_example/presentation/Home_screen/state/home_screen_state.dart';

final homescreenProvider = StateNotifierProvider((ref) {
  return HomeScreenController();
});

class HomeScreenController extends StateNotifier<HomeScreenState> {
  HomeScreenController() : super(HomeScreenState(count: 10));

  void onIncrement() {
    int currentcount = state.count!;
    currentcount++;
    state = HomeScreenState(count: currentcount);
  }
}
