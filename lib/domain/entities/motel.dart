import 'package:moteis/domain/entities/suite.dart';

class Motel {
  Motel({
    required this.name,
    required this.logo,
    required this.address,
    required this.distance,
    required this.favoriteNumber,
    required this.suites,
    required this.feedbackNumber,
    required this.rating,
  });

  final String name;
  final String logo;
  final String address;
  final double distance;
  final int favoriteNumber;
  final List<Suite> suites;
  final int feedbackNumber;
  final double rating;
}
