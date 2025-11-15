import 'package:riverpod_example/repository/api/Quotes_screen/models/quotesresmodel.dart';

class QuotesScreenState {
  bool? isLoading;
    List<Quote>? quotes;
  QuotesScreenState({this.isLoading = false , this.quotes});

  QuotesScreenState copyWith( {bool? isLoding, List<Quote>? quotes}) {
    return QuotesScreenState(isLoading: isLoding ?? isLoading, quotes: quotes ?? this.quotes );
  }
}
