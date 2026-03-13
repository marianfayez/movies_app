// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:movies_app/features/auth/presentation/screens/forget_password_screen.dart'
    as _i2;
import 'package:movies_app/features/auth/presentation/screens/sign_in_screen.dart'
    as _i6;
import 'package:movies_app/features/auth/presentation/screens/sign_up_screen.dart'
    as _i7;
import 'package:movies_app/features/home_tab/presentation/screens/upcoming_movies.dart'
    as _i9;
import 'package:movies_app/features/main_screen.dart' as _i3;
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart'
    as _i4;
import 'package:movies_app/features/on_boarding/presentation/screen/on_boarding_screen.dart'
    as _i5;
import 'package:movies_app/features/profile_tab/presentation/screens/edit_profile_screen.dart'
    as _i1;
import 'package:movies_app/features/splash_screen.dart' as _i8;

/// generated route for
/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i10.PageRouteInfo<void> {
  const EditProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i2.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i10.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ForgetPasswordRoute.name,
          args: ForgetPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>(
          orElse: () => const ForgetPasswordRouteArgs());
      return _i2.ForgetPasswordScreen(key: args.key);
    },
  );
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainScreen();
    },
  );
}

/// generated route for
/// [_i4.MovieDetailsScreen]
class MovieDetailsRoute extends _i10.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    required int movieId,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            movieId: movieId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i4.MovieDetailsScreen(
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

  final int movieId;

  final _i11.Key? key;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{movieId: $movieId, key: $key}';
  }
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i10.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i6.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}

/// generated route for
/// [_i9.UpcomingMoviesScreen]
class UpcomingMoviesRoute extends _i10.PageRouteInfo<void> {
  const UpcomingMoviesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UpcomingMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpcomingMoviesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.UpcomingMoviesScreen();
    },
  );
}
