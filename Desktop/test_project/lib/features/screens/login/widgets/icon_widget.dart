import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/navigator/navigator.dart';

Widget backIcon() {
  return const Icon(
    Icons.arrow_forward_ios,
    size: 17,
    color: Colors.white,
  );
}

Widget loadingIcon() {
  return const SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        strokeWidth: 4,
        color: AppColors.backgroundColor,
      ));
}

Widget goBackButton(BuildContext context, Color color) {
  return InkWell(
      child: Text(
        "Go back",
        style: TextStyle(
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: color),
      ),
      onTap: () {
        Navigator.pop(context);
      });
}

void movetoProfileScreen(BuildContext context) {
  context.popView();
  context.popView();
  context.popView();
  context.popView();
  context.popView();
  context.popView();
  context.popView();
  context.popView();
  context.popView();
  context.popView();

  // Navigator.pop(context);
}
