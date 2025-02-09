import 'package:flutter/material.dart';
import 'package:moteis/core/components/image_selector.dart';
import 'package:moteis/core/components/rating_icon.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/domain/entities/motel.dart';

class MotelInfo extends StatelessWidget {
  const MotelInfo({super.key, required this.motel});

  final Motel motel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ImageSelector(url: motel.logo, height: 50, width: 50),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(motel.name, style: AppTextStyles.title),
              Text.rich(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                TextSpan(
                  text: '${motel.distance} km - ',
                  children: [
                    TextSpan(text: motel.address),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                spacing: 10,
                children: [
                  RatingIcon(rating: motel.rating),
                  Row(
                    spacing: 2,
                    children: [
                      Text(
                        '${motel.feedbackNumber} avaliações',
                        style: AppTextStyles.caption,
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
            iconSize: 32,
          ),
        ],
      ),
    );
  }
}
