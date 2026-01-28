enum TaskStatus {
  open,
  discarded,
  finished,
  unknown;

  @override
  String toString() {
    return switch (this) {
      open => 'open',
      discarded => 'discarded',
      finished => 'finished',
      _ => 'unknown',
    };
  }

  static TaskStatus fromString({required String value}) {
    return switch (value) {
      'open' => open,
      'discarded' => discarded,
      'finished' => finished,
      _ => unknown,
    };
  }
}
