import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/features/profile_tab/presentation/bloc/profile_bloc.dart';
import 'package:movies_app/core/resources/request_state.dart';

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
          final favoriteMovies = state.favorites ?? [];

          final authState = context.watch<AuthBloc>().state;
          if (authState.requestState != RequestState.success || authState.authModel == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = authState.authModel?.user;
          final avatarId = user?.avatarId ?? 1;
          final userName = user?.name ?? "Guest";
          return SafeArea(
            child: Scaffold(
                backgroundColor: ColorManager.primary,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 52),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 24.h,vertical: 12.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/gamer$avatarId.png"),
                                    SizedBox(height: 16.h,),
                                    Text(userName,style: getBoldStyle2(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("${favoriteMovies.length??0}",style: getBoldStyle2(color: Colors.white)),
                                    SizedBox(height: 16.h,),
                                    Text("Wish List",style: getBoldStyle2(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text("${historyMovies.length??0}",style: getBoldStyle2(color: Colors.white)),
                                  SizedBox(height: 16.h),
                                  Text("History",style: getBoldStyle2(color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                  backgroundColor: ColorManager.secondary,
                                    isStadiumBorder: false,
                                    textColor: ColorManager.primary,
                                    label: "Edit Profile",
                                    onTap: () {  },
                                    ),
                              ),
                              SizedBox(width: 10.w),
                              CustomElevatedButton(
                                backgroundColor: Colors.red,
                                isStadiumBorder: false,
                                suffixIcon: const Icon(Icons.exit_to_app,color: Colors.white,),
                                  label: "Exit",
                                  onTap: () {
                                    BlocProvider.of<AuthBloc>(context).add(LogOut());
                                    context.replaceRoute(SignInRoute());
                                  },)

                            ],
                          ),
                        ),

                        // GridView.builder(
                        //   itemCount: historyMovies.length,
                        //   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 3,
                        //     mainAxisSpacing: 10.h,
                        //     childAspectRatio: .7,
                        //   ),
                        //   itemBuilder: (context, index) {
                        //     final movie = historyMovies[index];
                        //
                        //     return MovieItem(
                        //         movieId: movie.id ?? 0,
                        //         voteAverage: (movie.voteAverage ?? 0).toStringAsFixed(1),
                        //         movieImage: movie.posterPath ?? "");
                        //   },
                        // ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
