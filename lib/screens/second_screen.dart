import 'package:flutter/material.dart';
import 'package:city_tour/data/tour_data.dart';
import 'package:city_tour/widgets/tour_day_card.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Días de Tour',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 65, 110),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tourDays.length,
          itemBuilder: (context, index) {
            return TourDayCard(tourDay: tourDays[index]);
          },
        ),
      ),
    );
  }
}
