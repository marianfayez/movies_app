import 'package:auto_route/auto_route.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),


  ];
}

