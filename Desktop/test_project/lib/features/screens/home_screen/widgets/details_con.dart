import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';

import '../../../utils/app_image.dart';

class DetailsContainer1 extends StatelessWidget {
  const DetailsContainer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 380,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 67,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome, let’s get you started",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImage.walletIcon,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "View Virtual Card",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImage.currencyIcon,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "Set up direct deposit",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: 51,
          width: 380,
          decoration: const BoxDecoration(
            color: AppColors.detailsCon1Color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Checkings Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text(
                  "\$25,000.00",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DetailsContainer2 extends StatelessWidget {
  const DetailsContainer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 380,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 67,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome, let’s get you started",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImage.walletIcon,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "View Digital Card",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppImage.currencyIcon,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "Set up direct deposit",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: 51,
          width: 380,
          decoration: const BoxDecoration(
            color: AppColors.detailsCon2Color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Business Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text(
                  "\$5,000.00",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DetailsContainer3 extends StatelessWidget {
  const DetailsContainer3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 380,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 380,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
