import 'package:bloc/bloc.dart';
import 'package:moteis/core/errors/errors.dart';
import 'package:moteis/domain/entities/motel.dart';
import 'package:moteis/domain/use_cases/get_motels_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getMotelsUseCase) : super(HomeLoading());

  final GetMotelsUseCase _getMotelsUseCase;

  Future<void> getMotels() async {
    try {
      emit(HomeLoading());
      final motels = await _getMotelsUseCase();
      emit(HomeInitial(motels));
    } on AppError catch (error) {
      emit(HomeError(state.motels, error.message));
    } catch (error) {
      emit(HomeError(state.motels, 'Um erro inesperado ocorreu'));
    }
  }
}
