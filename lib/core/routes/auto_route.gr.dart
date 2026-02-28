// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:movies_app/features/auth/presentation/screens/forget_password_screen.dart'
    as _i1;
import 'package:movies_app/features/auth/presentation/screens/sign_in_screen.dart'
    as _i5;
import 'package:movies_app/features/auth/presentation/screens/sign_up_screen.dart'
    as _i6;
import 'package:movies_app/features/home_tab/presentation/screens/upcoming_movies.dart'
    as _i8;
import 'package:movies_app/features/main_screen.dart' as _i2;
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart'
    as _i3;
import 'package:movies_app/features/on_boarding/presentation/screen/on_boarding_screen.dart'
    as _i4;
import 'package:movies_app/features/splash_screen.dart' as _i7;

/// generated route for
/// [_i1.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i9.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ForgetPasswordRoute.name,
          args: ForgetPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>(
          orElse: () => const ForgetPasswordRouteArgs());
      return _i1.ForgetPasswordScreen(key: args.key);
    },
  );
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainScreen();
    },
  );
}

/// generated route for
/// [_i3.MovieDetailsScreen]
class MovieDetailsRoute extends _i9.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    required String movieId,
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            movieId: movieId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i3.MovieDetailsScreen(
        movieId: args.movieId,
        key: args.key,
      );
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    required this.movieId,
    this.key,
  });

  final String movieId;

  final _i10.Key? key;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{movieId: $movieId, key: $key}';
  }
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i5.SignInScreen]
class SignInRoute extends _i9.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i5.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashScreen();
    },
  );
}

/// generated route for
/// [_i8.UpcomingMoviesScreen]
class UpcomingMoviesRoute extends _i9.PageRouteInfo<void> {
  const UpcomingMoviesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          UpcomingMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpcomingMoviesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.UpcomingMoviesScreen();
    },
  );
}
