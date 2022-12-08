import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';
import 'package:venues/features/venues/domain/venues.repository.dart';
import 'package:venues/injector.dart';
import 'package:venues/presentation/cubit/pagination_cubit.dart';
import 'package:venues/presentation/pages/error/error.page.dart';
import 'package:venues/presentation/pages/venues/venues.page.dart';

class RoutersService {
  factory RoutersService.getInstance() => _instance;
  RoutersService._();
  static final _instance = RoutersService._();

  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: '/venues',
    errorBuilder: (context, state) => const ErrorPage(),
  );

  final List<GoRoute> _routes = <GoRoute>[
    GoRoute(
      name: venues,
      path: '/venues',
      builder: (context, state) => BlocProvider(
        // create: (_) =>
        //     VenuesCubit(repository: sl<VenuesRepository>())..loadVenues(),
        create: (_) => PaginationCubit<Venue>(
            action: () => sl<VenuesRepository>().getVenuesList())
          ..query(),
        child: const VenuesPage(),
      ),
    ),
  ];

  /// Venues Page.
  static String venues = UniqueKey().toString();
}
