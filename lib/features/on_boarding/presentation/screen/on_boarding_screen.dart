import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_state.dart';
import 'package:movies_app/features/on_boarding/presentation/screen/OnboardingButtons.dart';
import 'package:movies_app/features/on_boarding/presentation/screen/OnboardingFirstPage.dart';
import 'package:movies_app/features/on_boarding/presentation/screen/OnboardingPage.dart';
import 'package:movies_app/gen/assets.gen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    context
                        .read<OnboardingBloc>()
                        .add(OnboardingPageChanged(index));
                  },
                  children: [
                    const OnboardingFirstPage(),
                    OnboardingPage(
                      image: Assets.images.onBoarding2,
                      title: "Find Your Next Favorite Movie Here",
                      body: "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                    ),
                     OnboardingPage(
                      image: Assets.images.onBoarding3,
                      title: "Watch Anywhere",
                      body: "Enjoy movies anytime",
                    ),
                     OnboardingPage(
                      image: Assets.images.onBoarding4,
                      title: "Save Favorites",
                      body: "Create your watchlist",
                    ),
                     OnboardingPage(
                      image: Assets.images.onBoarding5,
                      title: "Get Started",
                      body: "Let’s begin your journey",
                    ),
                  ],
                ),
              ),
              OnboardingButtons(
                currentPage: state.currentPage,
                controller: controller,
              ),
            ],
          );
        },
      ),
    );
  }
}
