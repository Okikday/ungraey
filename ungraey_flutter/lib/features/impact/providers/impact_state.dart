import 'package:equatable/equatable.dart';
import 'package:ungraey_client/ungraey_client.dart';

/// State for the Earth Forward impact visualizer.
class ImpactState extends Equatable {
  final EcoImpact userImpact;
  final EcoImpact communityImpact;
  final bool isLoading;

  const ImpactState({
    required this.userImpact,
    required this.communityImpact,
    this.isLoading = false,
  });

  ImpactState copyWith({
    EcoImpact? userImpact,
    EcoImpact? communityImpact,
    bool? isLoading,
  }) {
    return ImpactState(
      userImpact: userImpact ?? this.userImpact,
      communityImpact: communityImpact ?? this.communityImpact,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [userImpact, communityImpact, isLoading];
}
