class AppState {
  final int headCounter;
  final int rightCounter;
  final int leftCounter;

  AppState({
    required this.headCounter,
    required this.rightCounter,
    required this.leftCounter});

  AppState.initial() :
    headCounter = 0,
    rightCounter = 0,
    leftCounter = 0;

  AppState copyWith({
    int? headCounter,
    int? rightCounter,
    int? leftCounter}) {

    return AppState(
      headCounter: headCounter ?? this.headCounter,
      rightCounter: rightCounter ?? this.rightCounter,
      leftCounter: leftCounter ?? this.leftCounter
    );
  }
}