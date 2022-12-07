import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        width: 380,
        decoration: BoxDecoration(
          color: AppColors.confirmationColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
