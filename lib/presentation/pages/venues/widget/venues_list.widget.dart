import 'package:flutter/material.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';
import 'package:venues/presentation/pages/venues/widget/venue_item.widget.dart';

class VenuesList extends StatelessWidget {
  final List<Venue> venues;
  const VenuesList({super.key, required this.venues});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: VenueItem(venue: venues[index]),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: venues.length,
    );
  }
}
