// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/auth/data/data_sources/remote/auth_remote_ds.dart' as _i981;
import 'features/auth/data/data_sources/remote/auth_remote_ds_impl.dart'
    as _i393;
import 'features/auth/data/data_sources/remote/firebase_user_remote_ds.dart'
    as _i888;
import 'features/auth/data/data_sources/remote/firebase_user_remote_ds_impl.dart'
    as _i9;
import 'features/auth/data/repositories/auth_repo_impl.dart' as _i426;
import 'features/auth/domain/repositories/auth_repo.dart' as _i416;
import 'features/auth/domain/use_cases/log_in_use_case.dart' as _i871;
import 'features/auth/domain/use_cases/sign_up_use_cases.dart' as _i606;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/home_tab/data/data_sources/remote/get_movies_remote_ds.dart'
    as _i581;
import 'features/home_tab/data/data_sources/remote/get_movies_remote_ds_impl.dart'
    as _i290;
import 'features/home_tab/data/repositories/get_movies_repo_impl.dart' as _i782;
import 'features/home_tab/domain/repositories/get_movies_repo.dart' as _i1065;
import 'features/home_tab/domain/use_cases/get_movies_use_case.dart' as _i437;
import 'features/home_tab/presentation/bloc/get_movies_bloc.dart' as _i404;
import 'features/movie_details/data/data_sources/remote/get_movies_details_remote_ds.dart'
    as _i1028;
import 'features/movie_details/data/data_sources/remote/get_movies_details_remote_ds_impl.dart'
    as _i83;
import 'features/movie_details/data/repositories/get_movies_details_repo_impl.dart'
    as _i523;
import 'features/movie_details/domain/repositories/get_movies_details_repo.dart'
    as _i423;
import 'features/movie_details/domain/use_cases/movie_details_use_cases.dart'
    as _i325;
import 'features/movie_details/presentation/bloc/movie_details_bloc.dart'
    as _i965;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i1028.GetMoviesDetailsRemoteDs>(
        () => _i83.GetMoviesRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i581.GetMoviesRemoteDs>(
        () => _i290.GetMoviesRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i888.FirebaseUserRemoteDS>(
        () => _i9.FirebaseUserRemoteDSImpl());
    gh.factory<_i423.GetMoviesDetailsRepo>(() =>
        _i523.GetMoviesDetailsRepoImpl(gh<_i1028.GetMoviesDetailsRemoteDs>()));
    gh.factory<_i1065.GetMoviesRepo>(
        () => _i782.GetMoviesRepoImpl(gh<_i581.GetMoviesRemoteDs>()));
    gh.factory<_i437.GetMoviesUseCase>(
        () => _i437.GetMoviesUseCase(gh<_i1065.GetMoviesRepo>()));
    gh.factory<_i404.GetMoviesBloc>(
        () => _i404.GetMoviesBloc(gh<_i437.GetMoviesUseCase>()));
    gh.factory<_i981.AuthRemoteDs>(
        () => _i393.AuthRemoteDsImpl(gh<_i888.FirebaseUserRemoteDS>()));
    gh.factory<_i325.MoviesDetailsUseCase>(
        () => _i325.MoviesDetailsUseCase(gh<_i423.GetMoviesDetailsRepo>()));
    gh.factory<_i416.AuthRepo>(
        () => _i426.AuthRepoImpl(gh<_i981.AuthRemoteDs>()));
    gh.factory<_i965.MovieDetailsBloc>(
        () => _i965.MovieDetailsBloc(gh<_i325.MoviesDetailsUseCase>()));
    gh.factory<_i871.LogInUseCase>(
        () => _i871.LogInUseCase(gh<_i416.AuthRepo>()));
    gh.factory<_i606.SignUpUseCases>(
        () => _i606.SignUpUseCases(gh<_i416.AuthRepo>()));
    gh.factory<_i363.AuthBloc>(() => _i363.AuthBloc(
          gh<_i606.SignUpUseCases>(),
          gh<_i871.LogInUseCase>(),
        ));
    return this;
  }
}
