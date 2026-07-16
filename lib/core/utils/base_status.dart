enum BaseStatus {
  init,
  loading,
  success,
  failure;

  bool get isLoading => this == .loading;
  bool get isSuccess => this == .success;
  bool get isFailure => this == .failure;
}
