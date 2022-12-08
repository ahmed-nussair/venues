import 'package:flutter/material.dart';
import 'package:venues/presentation/widgets/loading.widget.dart';

class LoadingVenues extends StatelessWidget {
  const LoadingVenues({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Loading(width: 200, height: 200, radius: 0),
          SizedBox(height: 4),
          Loading(width: 10, height: 12, radius: 0),
          SizedBox(height: 4),
          Loading(width: 20, height: 12, radius: 0),
          SizedBox(height: 4),
          Loading(width: 80, height: 12, radius: 0),
        ],
      ),
    );
  }
}
