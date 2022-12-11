import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onPressed,
    this.text = "Login",
    this.icon = const Icon(
      Icons.arrow_forward_ios,
      size: 17,
      color: Colors.white,
    ),
    this.textColor = AppColors.backgroundColor,
  }) : super(key: key);
  final Color? textColor;
  final VoidCallback? onPressed;
  final Widget icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: GestureDetector(
        child: Container(
          height: 60,
          width: 380,
          decoration: BoxDecoration(
            color: AppColors.confirmationColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Spacer(),
                icon
              ],
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
