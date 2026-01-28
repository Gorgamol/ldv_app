enum TaskPriority {
  low,
  normal,
  high,
  unknown;

  @override
  String toString() {
    return switch (this) {
      low => 'low',
      normal => 'normal',
      high => 'high',
      _ => 'unknown',
    };
  }

  static TaskPriority fromString({required String value}) {
    return switch (value) {
      'low' => low,
      'normal' => normal,
      'high' => high,
      _ => unknown,
    };
  }
}
