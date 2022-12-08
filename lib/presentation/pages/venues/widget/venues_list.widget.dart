import 'package:flutter/material.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';
import 'package:venues/presentation/pages/venues/widget/venue_item.widget.dart';

class VenuesList extends StatelessWidget {
  final ScrollController scrollController;
  final List<Venue> venues;
  final bool appendOneMoreTile;
  const VenuesList({
    super.key,
    required this.scrollController,
    required this.venues,
    required this.appendOneMoreTile,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: VenueItem(venue: venues[index]),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: venues.length + (appendOneMoreTile ? 1 : 0),
    );
  }
}
