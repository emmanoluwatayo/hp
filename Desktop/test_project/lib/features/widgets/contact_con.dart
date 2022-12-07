import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';

class ContactDetailsContainer extends StatelessWidget {
  const ContactDetailsContainer(
      {Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 47,
        width: 167,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.confirmationColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: AppColors.confirmationColor),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.confirmationColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
