import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';

import '../../../utils/app_image.dart';

class ReferalContainer extends StatelessWidget {
  const ReferalContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 115,
            width: 280,
            decoration: const BoxDecoration(
              color: AppColors.refer2Color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
        ),
        Container(
          height: 103,
          width: 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.referColor,
          ),
          child: Row(
            children: [
              Image.asset(
                AppImage.groupLink,
                scale: 2,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Get \$5 plus 10% of the fee for 365 days ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      Text(
                        "Refer a friend and get \$5 when they make their first dollars to naira exchange of \$500 and above, plus 10% of the fee everytime they make exchange for 365 days.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.subtitleColor),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
