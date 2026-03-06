import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';
import 'package:movies_app/features/profile_tab/presentation/bloc/profile_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(GetHistoryEvent()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.getHistoryRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.getHistoryRouteFailures?.message ??
                          "Something went wrong"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"))
                      ],
                    ));
          }
        },
        builder: (context, state) {
          if (state.getHistoryRequestState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final historyMovies = state.history ?? [];

          return Scaffold(
              backgroundColor: ColorManager.primary,
              body: GridView.builder(
                itemCount: historyMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,

                ),
                itemBuilder: (context, index) {
                  final movie = historyMovies[index];

                  return MovieItem(
                      movieId: movie.id ?? 0,
                      voteAverage: (movie.voteAverage ?? 0).toStringAsFixed(1),
                      movieImage: movie.posterPath ?? "");
                },
              ));
        },
      ),
    );
  }
}
// CustomElevatedButton(
// label: "Log Out",
// onTap: () {
// BlocProvider.of<AuthBloc>(context).add(LogOut());
// context.replaceRoute(SignInRoute());
// }),
