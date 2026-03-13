import 'package:auto_route/auto_route.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/features/home_tab/presentation/screens/upcoming_movies.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: UpcomingMoviesRoute.page),
    AutoRoute(page: MovieDetailsRoute.page),
    AutoRoute(page: EditProfileRoute.page),


  ];
}

