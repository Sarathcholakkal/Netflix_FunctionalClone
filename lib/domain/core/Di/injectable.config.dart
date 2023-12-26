// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix_app/application/download/download_bloc.dart' as _i5;
import 'package:netflix_app/application/fastandlaugh/fastandlaugh_bloc.dart'
    as _i6;
import 'package:netflix_app/application/search/search_bloc.dart' as _i9;
import 'package:netflix_app/domain/downloads/download_services.dart' as _i3;
import 'package:netflix_app/domain/search/search_services.dart' as _i7;
import 'package:netflix_app/infrastracture/downloads/download_services_impl.dart'
    as _i4;
import 'package:netflix_app/infrastracture/search/search_services_imp.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DownloadServices>(() => _i4.DownloadServicesImpl());
    gh.factory<_i5.DownloadsBloc>(
        () => _i5.DownloadsBloc(gh<_i3.DownloadServices>()));
    gh.factory<_i6.FastandlaughBloc>(
        () => _i6.FastandlaughBloc(gh<_i3.DownloadServices>()));
    gh.lazySingleton<_i7.SearchServices>(() => _i8.SearchservicesImp());
    gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc(
          gh<_i3.DownloadServices>(),
          gh<_i7.SearchServices>(),
        ));
    return this;
  }
}
