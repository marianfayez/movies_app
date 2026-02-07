// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:movies_app/features/auth/presentation/screens/forget_password_screen.dart'
    as _i1;
import 'package:movies_app/features/auth/presentation/screens/sign_in_screen.dart'
    as _i3;
import 'package:movies_app/features/auth/presentation/screens/sign_up_screen.dart'
    as _i4;
import 'package:movies_app/features/on_boarding/presentation/screen/on_boarding_screen.dart'
    as _i2;
import 'package:movies_app/features/splash_screen.dart' as _i5;

/// generated route for
/// [_i1.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i6.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ForgetPasswordRoute.name,
          args: ForgetPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static _i6.PageInfo page = _i6.PageInfo(
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

  final _i7.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i3.SignInScreen]
class SignInRoute extends _i6.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i3.SignInScreen(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
