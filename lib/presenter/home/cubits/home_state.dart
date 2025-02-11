part of 'home_cubit.dart';

sealed class HomeState {
  HomeState(this.motels);

  final List<Motel> motels;
}

final class HomeInitial extends HomeState {
  HomeInitial(super.motels);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeInitial && listEquals(other.motels, motels);
  }

  @override
  int get hashCode => motels.hashCode;
}

final class HomeLoading extends HomeState {
  HomeLoading() : super(const []);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeLoading && listEquals(other.motels, motels);
  }

  @override
  int get hashCode => motels.hashCode;
}

final class HomeError extends HomeState {
  HomeError(super.motels, this.message);

  final String message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeError &&
        listEquals(other.motels, motels) &&
        other.message == message;
  }

  @override
  int get hashCode => motels.hashCode ^ message.hashCode;
}
