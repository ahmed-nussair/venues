import 'package:flutter/material.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';

class VenueItem extends StatelessWidget {
  final Venue venue;
  const VenueItem({
    super.key,
    required this.venue,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            venue.name!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            venue.category!.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            venue.geolocationDegrees!,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
