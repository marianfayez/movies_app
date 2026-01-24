import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:movies_app/gen/assets.gen.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Assets.images.moviesPostersGroup.image(height: 350),
        const Spacer(),
        const Text(
          "Find Your Next Favorite Movie Here",
          style: TextStyle(
            color: Color(0xFFE2BE7F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context
                .read<OnboardingBloc>()
                .add(const OnboardingPageChanged(1));
          },
          child: const Text("Explore Now"),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
