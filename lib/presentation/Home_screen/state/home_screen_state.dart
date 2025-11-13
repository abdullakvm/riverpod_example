class HomeScreenState {
  int count;
  String? name;
  HomeScreenState({required this.count, this.name});

  HomeScreenState copyWith({ required int? count , String? name}) {
    return HomeScreenState(
      count: count ?? this.count,
      name: name ?? this.name
    );
  }
}
