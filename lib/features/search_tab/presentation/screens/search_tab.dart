import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/movie_item.dart';
import 'package:movies_app/features/search_tab/presentation/bloc/search_bloc.dart';
import 'package:movies_app/gen/assets.gen.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchMovieBloc>(),
      child: BlocConsumer<SearchMovieBloc, SearchState>(
        listener: (context, state) {
          if (state.searchMovieRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.searchMovieRouteFailures?.message ??
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
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    controller: searchController,
                    onChanged: (value) {
                      context
                          .read<SearchMovieBloc>()
                          .add(GetMovieByNameEvent(value));
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchMovieBloc, SearchState>(
                      builder: (context, state) {
                        if (state.searchMovieRequestState ==
                            RequestState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final movies = state.poplarMovieModel?.results ?? [];

                        if (movies.isEmpty) {
                          return Assets.images.searchPopCorn.image();
                        }
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return MovieItem(
                              movieId: movies[index].id ?? 0,
                              voteAverage: (movies[index].voteAverage ?? 0)
                                  .toStringAsFixed(1),
                              movieImage: movies[index].posterPath ?? "",
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
