// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.factory<_i888.FirebaseUserRemoteDS>(
        () => _i9.FirebaseUserRemoteDSImpl());
    gh.factory<_i981.AuthRemoteDs>(
        () => _i393.AuthRemoteDsImpl(gh<_i888.FirebaseUserRemoteDS>()));
    gh.factory<_i416.AuthRepo>(
        () => _i426.AuthRepoImpl(gh<_i981.AuthRemoteDs>()));
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
