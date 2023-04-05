// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipeapp/layers/application_layer/handler/load_handler/LoadHandler.dart'
    as _i7;
import 'package:recipeapp/layers/application_layer/handler/route_handler/RouteHandler.dart'
    as _i12;
import 'package:recipeapp/layers/application_layer/handler/theme_handler/ThemeHandler.dart'
    as _i15;
import 'package:recipeapp/layers/data_layer/service/local/local_database_service/LocalDatabaseService.dart'
    as _i8;
import 'package:recipeapp/layers/data_layer/service/remote/remote_database_service/api/RemoteApiDatabaseService.dart'
    as _i11;
import 'package:recipeapp/layers/domain_layer/entity/item_entity/ItemEntity.dart'
    as _i4;
import 'package:recipeapp/layers/domain_layer/repository/item_repository/ItemRepository.dart'
    as _i5;
import 'package:recipeapp/layers/presentation_layer/0_MyApp/view_model/MyAppViewModel.dart'
    as _i10;
import 'package:recipeapp/layers/presentation_layer/1_Splash/view_model/SplashViewModel.dart'
    as _i14;
import 'package:recipeapp/layers/presentation_layer/2.1_Main/view_model/MainViewModel.dart'
    as _i9;
import 'package:recipeapp/layers/presentation_layer/2.2_Search/view_model/SearchViewModel.dart'
    as _i13;
import 'package:recipeapp/layers/presentation_layer/2_Home/view_model/HomeViewModel.dart'
    as _i3;
import 'package:recipeapp/layers/presentation_layer/3.0_Item/view_model/ItemViewModel.dart'
    as _i6;

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
    gh.lazySingleton<_i3.HomeViewModel>(() => _i3.HomeViewModel());
    gh.lazySingleton<_i4.ItemEntity>(() => _i4.ItemEntity());
    gh.lazySingleton<_i5.ItemRepository>(() => _i5.ItemRepository());
    gh.lazySingleton<_i6.ItemViewModel>(() => _i6.ItemViewModel());
    gh.lazySingleton<_i7.LoadHandler>(() => _i7.LoadHandler());
    gh.factoryParam<_i8.LocalDatabaseService, String, dynamic>((
      _boxName,
      _,
    ) =>
        _i8.LocalDatabaseService(_boxName));
    gh.lazySingleton<_i9.MainViewModel>(() => _i9.MainViewModel());
    gh.lazySingleton<_i10.MyAppViewModel>(() => _i10.MyAppViewModel());
    gh.lazySingleton<_i11.RemoteApiDatabaseService>(
        () => _i11.RemoteApiDatabaseService());
    gh.lazySingleton<_i12.RouteHandler>(() => _i12.RouteHandler());
    gh.lazySingleton<_i13.SearchViewModel>(() => _i13.SearchViewModel());
    gh.lazySingleton<_i14.SplashViewModel>(() => _i14.SplashViewModel());
    gh.lazySingleton<_i15.ThemeHandler>(() => _i15.ThemeHandler());
    return this;
  }
}
