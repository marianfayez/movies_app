import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/button.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';

class OnboardingButtons extends StatelessWidget {
  final int currentPage;
  final PageController controller;

  const OnboardingButtons({
    super.key,
    required this.currentPage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == 4;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            TextButton(
              onPressed: () {
                controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text("Back"),
            ),
          Button(onTab: (){
            if (isLastPage) {
              context
                  .read<OnboardingBloc>()
                  .add(OnboardingDonePressed());
            } else {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }, text: isLastPage ? "Finish" : "Next",),
        ],
      ),
    );
  }
}
