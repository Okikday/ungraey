import 'package:equatable/equatable.dart';
import 'package:ungraey_client/ungraey_client.dart';

/// State of the QR handoff flow.
class HandoffState extends Equatable {
  final HandoffTransaction? activeTransaction;
  final bool isGenerating;
  final bool isVerifying;
  final bool isCompleted;
  final int secondsRemaining;

  const HandoffState({
    this.activeTransaction,
    this.isGenerating = false,
    this.isVerifying = false,
    this.isCompleted = false,
    this.secondsRemaining = 120,
  });

  HandoffState copyWith({
    HandoffTransaction? activeTransaction,
    bool? isGenerating,
    bool? isVerifying,
    bool? isCompleted,
    int? secondsRemaining,
  }) {
    return HandoffState(
      activeTransaction: activeTransaction ?? this.activeTransaction,
      isGenerating: isGenerating ?? this.isGenerating,
      isVerifying: isVerifying ?? this.isVerifying,
      isCompleted: isCompleted ?? this.isCompleted,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
    );
  }

  @override
  List<Object?> get props => [
    activeTransaction,
    isGenerating,
    isVerifying,
    isCompleted,
    secondsRemaining,
  ];
}
