import 'package:equatable/equatable.dart';

/// State of user profile and earnings wallet.
class ProfileState extends Equatable {
  final String name;
  final String handle;
  final String neighborhood;
  final double walletBalanceDollars;
  final int pointsBalance;
  final int completedHandoffs;
  final double rating;

  const ProfileState({
    this.name = 'Alex Rivera',
    this.handle = '@arivera_maker',
    this.neighborhood = 'Mission District, San Francisco',
    this.walletBalanceDollars = 62.50,
    this.pointsBalance = 480,
    this.completedHandoffs = 6,
    this.rating = 4.9,
  });

  @override
  List<Object?> get props => [
    name,
    handle,
    neighborhood,
    walletBalanceDollars,
    pointsBalance,
    completedHandoffs,
    rating,
  ];
}
