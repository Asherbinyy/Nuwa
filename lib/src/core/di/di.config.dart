// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/dashboard/presentation/logic/dashboard_controller.dart'
    as _i792;
import '../../features/date_collection/presentation/logic/data_collection_controller.dart'
    as _i1049;
import '../../features/splash/presentation/logic/splash_controller.dart'
    as _i491;
import '../services/permissions_handler_service.dart' as _i237;
import '../services/sketch/sketch_service.dart' as _i790;
import '../services/sketch/sketch_service_interface.dart' as _i165;
import '../services/sketch_exporter/sketch_exporter_service.dart' as _i799;
import '../services/sketch_exporter/sketch_exporter_service_interface.dart'
    as _i756;
import '../services/stylus/stylus_connection_interface.dart' as _i356;
import '../services/stylus/stylus_connection_service.dart' as _i781;
import '../services/word_generator/word_generator_interface.dart' as _i775;
import '../services/word_generator/word_generator_service.dart' as _i121;

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
    gh.factory<_i491.SplashController>(() => _i491.SplashController());
    gh.lazySingleton<_i165.ISketchService>(() => _i790.SketchService());
    gh.lazySingleton<_i356.IStylusConnection>(
        () => _i781.StylusConnectionService());
    gh.lazySingleton<_i775.IWordGenerator>(() => _i121.WordGeneratorService());
    gh.factory<_i237.IPermissionHandler>(
        () => _i237.PermissionsHandlerService());
    gh.factory<_i792.DashboardController>(
        () => _i792.DashboardController(gh<_i356.IStylusConnection>()));
    gh.lazySingleton<_i756.ISketchExporterService>(
        () => _i799.SketchExporterService(gh<_i237.IPermissionHandler>()));
    gh.factory<_i1049.DataCollectionController>(
        () => _i1049.DataCollectionController(
              gh<_i165.ISketchService>(),
              gh<_i775.IWordGenerator>(),
              gh<_i756.ISketchExporterService>(),
              gh<_i356.IStylusConnection>(),
            ));
    return this;
  }
}
