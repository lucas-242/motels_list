import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/presenter/home/cubits/image_viewer_cubit.dart';

class ImageControllerButtons extends StatelessWidget {
  const ImageControllerButtons({
    super.key,
    required this.suite,
    required this.onPrevious,
    required this.onNext,
    required this.pageController,
  });

  final Suite suite;
  final PageController pageController;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPrevious,
          icon: Icon(Icons.chevron_left),
        ),
        Expanded(
          child: Column(
            spacing: AppInsets.xxs,
            children: [
              Text(
                suite.name,
                style: AppTextStyles.bodyBig,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              BlocBuilder<ImageViewerCubit, ImageViewerState>(
                buildWhen: (previous, current) =>
                    previous.currentIndex != current.currentIndex,
                builder: (context, state) {
                  return Text(
                    '${state.currentIndex + 1} / ${suite.images.length}',
                    style: AppTextStyles.body,
                  );
                },
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNext,
          icon: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
