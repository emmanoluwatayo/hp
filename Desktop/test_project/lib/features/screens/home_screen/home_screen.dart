import 'package:flutter/material.dart';
import 'package:test_project/features/screens/home_screen/widgets/details_con.dart';
import 'package:test_project/features/screens/home_screen/widgets/refer_con.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/features/utils/app_image.dart';

import 'widgets/currency_exchange.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    Image.asset(
                      AppImage.profilePics,
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.subtitleColor),
                        ),
                        Text(
                          "Michael",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.titleColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppImage.notificationIcon,
                        scale: 4,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: DetailsContainer1(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: DetailsContainer2(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: ReferalContainer(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: CurrencyExchange(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
