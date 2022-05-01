// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../cubits/auth_cubit.dart' as _i7;
import '../../features/login/domain/cubits/user_cubit.dart' as _i6;
import '../../features/login/repository/user_repository.dart' as _i4;
import '../../repositories/auth_repository.dart' as _i5;
import '../info/info_cubit.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.InfoCubit>(() => _i3.InfoCubit());
  gh.factory<_i4.UserRepository>(() => _i4.AppUserRepository());
  gh.factory<_i5.AuthRepository>(
      () => _i5.AppAuthRepository(get<_i4.UserRepository>()));
  gh.lazySingleton<_i6.UserCubit>(
      () => _i6.UserCubit(get<_i4.UserRepository>()));
  gh.factory<_i7.AuthCubit>(() => _i7.AuthCubit(get<_i5.AuthRepository>()));
  return get;
}
