import 'package:bloc/bloc.dart';

part 'image_viewer_state.dart';

class ImageViewerCubit extends Cubit<ImageViewerState> {
  ImageViewerCubit(int currentIndex)
      : super(ImageViewerInitial(currentIndex: currentIndex));

  void changeIndex(int index) {
    emit(ImageViewerInitial(currentIndex: index));
  }
}
