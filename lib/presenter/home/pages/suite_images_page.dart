import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';
import 'package:moteis/presenter/home/pages/suite_image_viewer.dart';

class SuiteImagesPage extends StatelessWidget {
  const SuiteImagesPage({super.key, required this.suite});
  final Suite suite;

  @override
  Widget build(BuildContext context) {
    const iconSize = 40.0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: AppInsets.xxxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppInsets.xxs,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(Icons.arrow_drop_down, size: iconSize),
                  ),
                  Expanded(
                    child: Text(
                      suite.name,
                      style: AppTextStyles.bodyBig,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: suite.images.length,
                  itemBuilder: (context, index) {
                    final image = suite.images[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppInsets.sm),
                      child: GestureDetector(
                        onTap: () => Scaffold.of(context).showBottomSheet(
                          backgroundColor: AppColors.background,
                          enableDrag: false,
                          (context) => SuiteImageViewer(
                            suite: suite,
                            initialIndex: index,
                          ),
                        ),
                        child: ImageSelector(
                          url: image,
                          fit: BoxFit.cover,
                          height: context.height * .25,
                          width: context.width,
                          borderRadius: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
