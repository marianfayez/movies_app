// abstract class BottomNavState {}
//
// class BottomNavInitial extends BottomNavState {
//   final int selectedIndex;
//   BottomNavInitial({this.selectedIndex = 0});
// }

import 'package:movies_app/core/failuers/failuers.dart';

enum RequestState { init, loading, error, success }

class BottomNavState {
  final int selectedIndex;

  RequestState? requestState;

  RouteFailures? routeFailures;

  BottomNavState({
    this.routeFailures,
    this.requestState,
    this.selectedIndex = 0,
  });

  BottomNavState copyWith({
    int? selectedIndex,
    RequestState? requestState,
    RouteFailures? routeFailures,
  }) {
    return BottomNavState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      requestState: requestState ?? this.requestState,
      routeFailures: routeFailures ?? this.routeFailures,
    );
  }
}

final class BottomNavInitial extends BottomNavState {
  BottomNavInitial()
      : super(
          selectedIndex: 0,
          requestState: RequestState.init,
        );
}
