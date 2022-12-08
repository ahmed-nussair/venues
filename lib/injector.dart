import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:venues/core/network.core.dart';
import 'package:venues/features/venues/data/datasource/remote_venues.datasource.dart';
import 'package:venues/features/venues/data/venues.repository.impl.dart';
import 'package:venues/features/venues/domain/venues.repository.dart';
import 'package:venues/presentation/pages/venues/cubit/venues_cubit.dart';

final sl = GetIt.I;

Future<void> initInjections() async {
  // the base URL.
  const String baseUrl = 'https://coinmap.org/api/v1/';
  // Dio Cache Manager object
  final dioCacheManger = DioCacheManager(
    CacheConfig(
      baseUrl: baseUrl,
    ),
  );

  // Dio object
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  )

    // Adding PrettyDioLogger
    ..interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
      ),
    )

    // Adding DioCacheManager
    ..interceptors.add(
      dioCacheManger.interceptor,
    );

  sl
    // registering network info
    ..registerLazySingleton(() => Connectivity())
    ..registerLazySingleton<NetworkInfo>(() => ConnectivityNetworkInfo(sl()));

  sl
    // registering venues repository
    ..registerLazySingleton(() => dio)
    ..registerFactory<RemoteVenuesDataSource>(
      () => DioVenuesDataSource(
        dio: sl(),
      ),
    )
    ..registerLazySingleton<VenuesRepository>(
      () => VenuesRepositoryImpl(
        remoteDataSource: sl(),
      ),
    );

  // registering venues cubit
  sl.registerLazySingleton(
    () => VenuesCubit(
      repository: sl(),
    ),
  );
}
