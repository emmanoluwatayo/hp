import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/features/utils/app_image.dart';

class CurrencyExchange extends StatelessWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      width: 380,
      decoration: BoxDecoration(
        color: AppColors.curexchColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            AppImage.mobilePhone,
            scale: 2,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Currency Exchange",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black),
                ),
                Text(
                  "View penidng and completed\n exchange request",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.subtitleColor),
                ),
              ])
        ],
      ),
    );
  }
}
