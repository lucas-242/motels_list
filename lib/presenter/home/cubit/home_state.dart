part of 'home_cubit.dart';

sealed class HomeState {
  HomeState(this.motels);

  final List<Motel> motels;
}

final class HomeInitial extends HomeState {
  HomeInitial(super.motels);
}

final class HomeLoading extends HomeState {
  HomeLoading() : super([]);
}

final class HomeError extends HomeState {
  HomeError(super.motels, this.message);

  final String message;
}
