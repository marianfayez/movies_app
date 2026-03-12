import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingPageChanged extends OnboardingEvent {
  final int index;

  const OnboardingPageChanged(this.index);

  @override
  List<Object?> get props => [index];
}

class OnboardingSkipPressed extends OnboardingEvent {}

class OnboardingDonePressed extends OnboardingEvent {}
