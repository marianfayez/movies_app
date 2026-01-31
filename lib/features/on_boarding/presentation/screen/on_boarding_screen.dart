import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_state.dart';
import 'package:movies_app/features/on_boarding/presentation/screen/OnboardingFirstPage.dart';
import 'package:movies_app/features/on_boarding/presentation/screen/OnboardingPage.dart';
import 'package:movies_app/gen/assets.gen.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Scaffold(
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
                      OnboardingFirstPage(controller: controller,),
                      OnboardingPage(
                        controller: controller,
                        image: Assets.images.onBoarding1,
                        title: "Discover Movies",
                        body: "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
                      ),
                      OnboardingPage(
                        controller: controller,
                        image: Assets.images.onBoarding2,
                        title: "Explore All Genres",
                        body: "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
                      ),
                      OnboardingPage(
                        controller: controller,
                        image: Assets.images.onBoarding3,
                        title: "Create Watchlists",
                        body: "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
                      ),
                      OnboardingPage(
                        controller: controller,
                        image: Assets.images.onBoarding4,
                        title: "Rate, Review, and Learn",
                        body: "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
                      ),
                      OnboardingPage(
                        controller: controller,
                        image: Assets.images.onBoarding5,
                        title: "Start Watching Now",
                        body: "",
                      ),

                    ],
                  ),
                ),
                // OnboardingButtons(
                //   currentPage: state.currentPage,
                //   controller: controller,
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
