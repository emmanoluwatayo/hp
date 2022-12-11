import 'package:flutter/material.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/features/widgets/text_form_field.dart';

class MzFormDialog extends ModalRoute<void> {
  String message;
  String buttonText;
  VoidCallback? buttonClicked;

  MzFormDialog(
    this.message, {
    this.buttonText = "Try again",
    @required this.buttonClicked,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    var edgePaddingPercentage = MediaQuery.of(context).size.width * 0.7;
    var side = MediaQuery.of(context).size.width - edgePaddingPercentage;
    var sidePadding = side / 2;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sidePadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            // Container(
            //   height: 180,
            //   width: 180,
            //   alignment: Alignment.center,
            //   child: Lottie.asset(
            //     'resources/lotties/error.json',
            //     reverse: false,
            //     repeat: false,
            //   ),
            // ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 4,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(height: 1.5),
              ),
            ),
            const SizedBox(height: 10),
            getBottomContent(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget getBottomContent(BuildContext context) {
    final passwordController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
        child: Column(
          children: [
            Text(
              "Password",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.confirmationColor),
            ),
            TextFormInput(
              labelText: ".............",
              controller: passwordController,
              enabled: true,
              validator: (value) => null,
              obscureText: false,
              suffixIcon: Image.asset(""
                  // AppImage.visibleIcon,
                  // scale: SizeConfig.blockH! * 1.5,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
