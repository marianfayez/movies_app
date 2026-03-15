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
import 'features/auth/data/models/auth_model.dart' as _i583;
import 'features/auth/data/repositories/auth_repo_impl.dart' as _i426;
import 'features/auth/domain/repositories/auth_repo.dart' as _i416;
import 'features/auth/domain/use_cases/log_in_use_case.dart' as _i871;
import 'features/auth/domain/use_cases/sign_up_use_cases.dart' as _i606;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/explore_tab/data/data_sources/remote/explore_remote_ds.dart'
    as _i889;
import 'features/explore_tab/data/data_sources/remote/explore_remote_ds_impl.dart'
    as _i451;
import 'features/explore_tab/data/repositories/explore_repo_impl.dart' as _i185;
import 'features/explore_tab/domain/repositories/explore_repo.dart' as _i837;
import 'features/explore_tab/domain/use_cases/explore_use_case.dart' as _i112;
import 'features/explore_tab/presentation/bloc/explore_bloc.dart' as _i840;
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
import 'features/profile_tab/data/data_sources/remote/favorite_remote_ds.dart'
    as _i774;
import 'features/profile_tab/data/data_sources/remote/favorite_remote_ds_impl.dart'
    as _i931;
import 'features/profile_tab/data/data_sources/remote/get_history_remote_ds.dart'
    as _i245;
import 'features/profile_tab/data/data_sources/remote/get_history_remote_ds_impl.dart'
    as _i584;
import 'features/profile_tab/data/data_sources/remote/get_movie_remote_ds.dart'
    as _i121;
import 'features/profile_tab/data/data_sources/remote/get_movie_remote_ds_impl.dart'
    as _i121;
import 'features/profile_tab/data/repositories/favorite_repo_impl.dart'
    as _i298;
import 'features/profile_tab/data/repositories/get_history_repo_impl.dart'
    as _i622;
import 'features/profile_tab/data/repositories/get_movie_repo_impl.dart'
    as _i574;
import 'features/profile_tab/domain/repositories/favorite_repo.dart' as _i415;
import 'features/profile_tab/domain/repositories/get_history_repo.dart' as _i79;
import 'features/profile_tab/domain/repositories/get_movie_repo.dart' as _i161;
import 'features/profile_tab/domain/use_cases/favorite_use_cases.dart' as _i202;
import 'features/profile_tab/domain/use_cases/get_history_use_case.dart'
    as _i236;
import 'features/profile_tab/domain/use_cases/get_movie_use_case.dart' as _i382;
import 'features/profile_tab/presentation/bloc/profile_bloc.dart' as _i593;
import 'features/search_tab/data/data_sources/remote/search_remote_ds.dart'
    as _i247;
import 'features/search_tab/data/data_sources/remote/search_remote_ds_impl.dart'
    as _i241;
import 'features/search_tab/data/repositories/search_repo_impl.dart' as _i229;
import 'features/search_tab/domain/repositories/search_repo.dart' as _i1003;
import 'features/search_tab/domain/use_cases/search_use_case.dart' as _i811;
import 'features/search_tab/presentation/bloc/search_bloc.dart' as _i499;

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
    gh.factory<_i121.GetMovieRemoteDs>(
        () => _i121.GetMovieRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i889.ExploreRemoteDs>(
        () => _i451.ExploreRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i1028.GetMoviesDetailsRemoteDs>(
        () => _i83.GetMoviesRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i581.GetMoviesRemoteDs>(
        () => _i290.GetMoviesRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i247.SearchRemoteDs>(
        () => _i241.SearchRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i837.ExploreRepo>(
        () => _i185.ExploreRepoImpl(gh<_i889.ExploreRemoteDs>()));
    gh.factory<_i774.FavoriteRemoteDs>(() => _i931.FavoriteRemoteDsImpl());
    gh.factory<_i415.FavoriteRepo>(
        () => _i298.FavoriteRepoImpl(gh<_i774.FavoriteRemoteDs>()));
    gh.factory<_i112.ExploreUseCase>(
        () => _i112.ExploreUseCase(gh<_i837.ExploreRepo>()));
    gh.factory<_i245.HistoryRemoteDs>(() => _i584.HistoryRemoteDsImpl());
    gh.factory<_i888.FirebaseUserRemoteDS>(
        () => _i9.FirebaseUserRemoteDSImpl());
    gh.factory<_i423.GetMoviesDetailsRepo>(() =>
        _i523.GetMoviesDetailsRepoImpl(gh<_i1028.GetMoviesDetailsRemoteDs>()));
    gh.factory<_i79.HistoryRepo>(
        () => _i622.HistoryRepoImpl(gh<_i245.HistoryRemoteDs>()));
    gh.factory<_i1003.SearchRepo>(
        () => _i229.SearchRepoImpl(gh<_i247.SearchRemoteDs>()));
    gh.factory<_i1065.GetMoviesRepo>(
        () => _i782.GetMoviesRepoImpl(gh<_i581.GetMoviesRemoteDs>()));
    gh.factory<_i161.GetMovieRepo>(
        () => _i574.GetMovieRepoImpl(gh<_i121.GetMovieRemoteDs>()));
    gh.factory<_i437.GetMoviesUseCase>(
        () => _i437.GetMoviesUseCase(gh<_i1065.GetMoviesRepo>()));
    gh.factory<_i840.ExploreBloc>(
        () => _i840.ExploreBloc(gh<_i112.ExploreUseCase>()));
    gh.factory<_i404.GetMoviesBloc>(
        () => _i404.GetMoviesBloc(gh<_i437.GetMoviesUseCase>()));
    gh.factory<_i202.FavoriteUseCases>(
        () => _i202.FavoriteUseCases(gh<_i415.FavoriteRepo>()));
    gh.factory<_i811.SearchUseCase>(
        () => _i811.SearchUseCase(gh<_i1003.SearchRepo>()));
    gh.factory<_i382.GetMovieUseCase>(
        () => _i382.GetMovieUseCase(gh<_i161.GetMovieRepo>()));
    gh.factory<_i981.AuthRemoteDs>(
        () => _i393.AuthRemoteDsImpl(gh<_i888.FirebaseUserRemoteDS>()));
    gh.factory<_i499.SearchMovieBloc>(
        () => _i499.SearchMovieBloc(gh<_i811.SearchUseCase>()));
    gh.factory<_i325.MoviesDetailsUseCase>(
        () => _i325.MoviesDetailsUseCase(gh<_i423.GetMoviesDetailsRepo>()));
    gh.factory<_i236.HistoryUseCase>(
        () => _i236.HistoryUseCase(gh<_i79.HistoryRepo>()));
    gh.factory<_i416.AuthRepo>(
        () => _i426.AuthRepoImpl(gh<_i981.AuthRemoteDs>()));
    gh.factory<_i593.ProfileBloc>(() => _i593.ProfileBloc(
          gh<_i583.FirebaseAuthModel>(),
          gh<_i236.HistoryUseCase>(),
          gh<_i382.GetMovieUseCase>(),
          gh<_i202.FavoriteUseCases>(),
          gh<_i888.FirebaseUserRemoteDS>(),
        ));
    gh.factory<_i965.MovieDetailsBloc>(
        () => _i965.MovieDetailsBloc(gh<_i325.MoviesDetailsUseCase>()));
    gh.factory<_i871.LogInUseCase>(
        () => _i871.LogInUseCase(gh<_i416.AuthRepo>()));
    gh.factory<_i606.SignUpUseCases>(
        () => _i606.SignUpUseCases(gh<_i416.AuthRepo>()));
    gh.factory<_i363.AuthBloc>(() => _i363.AuthBloc(
          gh<_i606.SignUpUseCases>(),
          gh<_i871.LogInUseCase>(),
          gh<_i888.FirebaseUserRemoteDS>(),
        ));
    return this;
  }
}
