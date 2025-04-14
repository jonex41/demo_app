class DurationRange {
  final Duration min;
  final Duration max;

  const DurationRange({required this.min, required this.max});

  bool contains(Duration age) {
    return age >= min && age < max;
  }
}
