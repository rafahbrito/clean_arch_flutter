abstract interface class IUseCase<T, P> {
  Future<T> execute({P params});
}
