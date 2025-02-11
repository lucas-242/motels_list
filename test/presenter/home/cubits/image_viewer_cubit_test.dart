import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moteis/presenter/home/cubits/image_viewer_cubit.dart';

void main() {
  setUpAll(() {});

  test('initial state is ImageViewerInitial', () {
    final cubit = ImageViewerCubit(1);
    expect(cubit.state, isA<ImageViewerInitial>());
    expect(cubit.state.currentIndex, 1);
    cubit.close();
  });

  blocTest<ImageViewerCubit, ImageViewerState>(
    'emits [ImageViewerInitial] when changeIndex is called',
    build: () => ImageViewerCubit(1),
    act: (cubit) => cubit.changeIndex(3),
    expect: () => [
      isA<ImageViewerInitial>()
          .having((state) => state.currentIndex, 'Image index', 3),
    ],
  );
}
