part of 'image_viewer_cubit.dart';

sealed class ImageViewerState {
  ImageViewerState({required this.currentIndex});

  final int currentIndex;
}

final class ImageViewerInitial extends ImageViewerState {
  ImageViewerInitial({required super.currentIndex});
}
