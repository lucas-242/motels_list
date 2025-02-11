import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/suite.dart';

class SuiteImagesPage extends StatelessWidget {
  const SuiteImagesPage({super.key, required this.suite});
  final Suite suite;

  @override
  Widget build(BuildContext context) {
    const iconSize = 40.0;

    return SafeArea(
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
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(Icons.arrow_drop_down, size: iconSize),
                  ),
                  Text(
                    suite.name,
                    style: AppTextStyles.bodyBig,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: iconSize),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: suite.images.length,
                  itemBuilder: (context, index) {
                    final image = suite.images[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppInsets.sm),
                      child: ImageSelector(
                        url: image,
                        fit: BoxFit.cover,
                        height: context.height * .25,
                        width: context.width,
                        borderRadius: 0,
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
