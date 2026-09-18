/// Lifecycle status for a bounty posting.
enum BountyStatus {
  active,
  fulfilled,
  cancelled;

  String get label => name[0].toUpperCase() + name.substring(1);
}

/// Lifecycle status for a waste pile snap.
enum SnapStatus {
  available,
  matched,
  handedOff;

  String get label => name[0].toUpperCase() + name.substring(1);
}
