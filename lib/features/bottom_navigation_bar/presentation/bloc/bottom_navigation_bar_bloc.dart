import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_event.dart';
import 'package:movies_app/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(
        selectedIndex: event.selectedIndex,
        requestState: RequestState.success,
      ));
    });
  }
}
