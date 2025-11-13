import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_example/presentation/quotes_screen/state/quotes_screen_state.dart';
import 'package:riverpod_example/repository/api/Quotes_screen/models/quotesresmodel.dart';

final qoutesScreenProvider = StateNotifierProvider.autoDispose(
  (ref) => QoutesScreenNotifier(),
);

class QoutesScreenNotifier extends StateNotifier<QuotesScreenState> {
  QoutesScreenNotifier() : super(QuotesScreenState());

  Future<void> getData() async {
    state = state.copyWith(isLoding: true);
    try {
      final url = Uri.parse("https://dummyjson.com/quotes");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // convert to model and assign to state

        QuotesResModel qoutesRes = quotesResModelFromJson(response.body);
        state = state.copyWith(quotes: qoutesRes.quotes, isLoding: false);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    state = state.copyWith(isLoding: false);
  }
}
