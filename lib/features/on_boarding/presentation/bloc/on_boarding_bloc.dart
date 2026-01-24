import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_state.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingSkipPressed>(_onSkip);
    on<OnboardingDonePressed>(_onDone);
  }

  void _onPageChanged(
      OnboardingPageChanged event,
      Emitter<OnboardingState> emit,
      ) {
    emit(state.copyWith(currentPage: event.index));
  }

  void _onSkip(
      OnboardingSkipPressed event,
      Emitter<OnboardingState> emit,
      ) {
    // هنا لاحقًا:
    // CacheHelper.saveOnboardingSeen();
  }

  void _onDone(
      OnboardingDonePressed event,
      Emitter<OnboardingState> emit,
      ) {
    // نفس فكرة skip
  }
}
