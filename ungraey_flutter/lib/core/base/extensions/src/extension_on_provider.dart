import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Extension helpers on [NotifierProvider] to provide standard blueprint syntax.
extension NotifierProviderX<TNotifier extends Notifier<TState>, TState>
    on NotifierProvider<TNotifier, TState> {
  TState watch(WidgetRef ref) => ref.watch(this);
  TState read(WidgetRef ref) => ref.read(this);
  TNotifier not(WidgetRef ref) => ref.read(notifier);

  TState watchX(Ref ref) => ref.watch(this);
  TState readX(Ref ref) => ref.read(this);
  TNotifier notX(Ref ref) => ref.read(notifier);
}

/// Extension helpers on [AutoDisposeNotifierProvider].
extension AutoDisposeNotifierProviderX<
  TNotifier extends AutoDisposeNotifier<TState>,
  TState
>
    on AutoDisposeNotifierProvider<TNotifier, TState> {
  TState watch(WidgetRef ref) => ref.watch(this);
  TState read(WidgetRef ref) => ref.read(this);
  TNotifier not(WidgetRef ref) => ref.read(notifier);

  TState watchX(Ref ref) => ref.watch(this);
  TState readX(Ref ref) => ref.read(this);
  TNotifier notX(Ref ref) => ref.read(notifier);
}
