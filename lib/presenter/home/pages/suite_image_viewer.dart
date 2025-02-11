import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/presenter/home/components/image_controller_buttons.dart';
import 'package:moteis/presenter/home/cubits/image_viewer_cubit.dart';

class SuiteImageViewer extends StatefulWidget {
  const SuiteImageViewer({
    super.key,
    required this.suite,
    required this.initialIndex,
  });
  final Suite suite;
  final int initialIndex;

  @override
  State<SuiteImageViewer> createState() => _SuiteImageViewerState();
}

class _SuiteImageViewerState extends State<SuiteImageViewer> {
  late final PageController _pageController;

  late final ImageViewerCubit _cubit;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialIndex);
    _cubit = ImageViewerCubit(widget.initialIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: AppInsets.xxxl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppInsets.md,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(Icons.close, size: 28),
                    ),
                  ],
                ),
                Spacer(),
                Expanded(
                  child: PageView.builder(
                    itemCount: widget.suite.images.length,
                    controller: _pageController,
                    onPageChanged: (index) => _cubit.changeIndex(index),
                    itemBuilder: (context, index) => ImageSelector(
                      url: widget.suite.images[index],
                      borderRadius: 0,
                      width: context.width,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppInsets.sm,
                    right: AppInsets.sm,
                    bottom: AppInsets.xxxl,
                  ),
                  child: ImageControllerButtons(
                    suite: widget.suite,
                    onNext: () => _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                    onPrevious: () => _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                    pageController: _pageController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
