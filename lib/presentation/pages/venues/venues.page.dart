import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';
import 'package:venues/presentation/cubit/pagination_cubit.dart';
import 'package:venues/presentation/pages/venues/widget/loading_venues.widget.dart';
import 'package:venues/presentation/pages/venues/widget/venue_item.widget.dart';
import 'package:venues/presentation/pages/venues/widget/venues_list.widget.dart';

class VenuesPage extends StatefulWidget {
  const VenuesPage({super.key});

  @override
  State<VenuesPage> createState() => _VenuesPageState();
}

class _VenuesPageState extends State<VenuesPage> {
  final scrollController = ScrollController();
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        scrollController.addListener(() {
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent / 2) {
            context.read<PaginationCubit<Venue>>().query();
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PaginationCubit<Venue>, PaginationState<Venue>>(
          builder: (context, state) {
            bool appendOneMoreTile = false;
            if (state is FailureState<Venue>) {
              return Center(
                child: Text(state.failureMessage),
              );
            }
            if (state is LoadingState<Venue>) {
              if (state.isFirstLoading) {
                return ListView.builder(
                  itemBuilder: (_, __) => const LoadingVenues(),
                  itemCount: 10,
                );
              } else {
                appendOneMoreTile = true;
              }
              // return SkeletonListView();
            }
            return VenuesList(
              scrollController: scrollController,
              venues: state.items,
              appendOneMoreTile: appendOneMoreTile,
            );
          },
        ),
      ),
    );
  }
}
