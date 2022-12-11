import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:test_project/features/main_navigation/main_navigation_screen.dart';
import 'package:test_project/features/screens/login/login_screen.dart';
import 'package:test_project/features/screens/login/widgets/checkbox.dart';

import '../../utils/app_colors.dart';
import '../../widgets/widgets.dart';

class SignUpNumber extends StatefulHookConsumerWidget {
  const SignUpNumber({Key? key}) : super(key: key);

  @override
  _SignUpNumberState createState() => _SignUpNumberState();
}

class _SignUpNumberState extends ConsumerState<SignUpNumber> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "Michael",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 27,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.inputLabelColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFielColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InternationalPhoneNumberInput(
                            maxLength: 13,
                            textFieldController: phoneNumberController,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(),
                            spaceBetweenSelectorAndTextField: 0,
                            onInputChanged: (phoneNumberController) {},
                            selectorConfig: const SelectorConfig(
                              showFlags: false,
                              trailingSpace: false,
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            selectorTextStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(),
                            countries: const ["NG"],
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: true,
                            ),
                            inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            onSaved: (PhoneNumber number) {},
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.inputLabelColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFielColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextFormInput2(
                            controller: passwordController,
                            validator: (string) => null,
                            obscureText: true,
                            labelText: "password",
                            suffixIcon: const Icon(Icons.visibility,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              LabeledCheckbox(),
                              Text(
                                "Remember Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppColors.inputLabelColor),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 73,
                    ),
                    AuthButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainNavigationScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.confirmationColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 53,
                    ),
                    const Text(
                      "-or log in with-",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const ContactDetailsContainer(
                          icon: Icons.mail, text: "Email"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
