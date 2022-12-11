// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:test_project/data/controller/generic_state_notifier.dart';
import 'package:test_project/features/main_navigation/main_navigation_screen.dart';
import 'package:test_project/features/screens/login/view_model.dart';
import 'package:test_project/features/screens/login/widgets/checkbox.dart';
import 'package:test_project/features/screens/login/widgets/route_name.dart';
import 'package:test_project/features/screens/login_number/login_num_screen.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/models/login_request.dart';
import 'package:test_project/navigator/navigator.dart';
import '../../widgets/screenUtils/screen_utils.dart';
import '../../widgets/widgets.dart';
import 'widgets/icon_widget.dart';

class SignupScreen extends StatefulHookConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  var value = false;
  late final RouteName routeName;

  @override
  Widget build(BuildContext context) {
    final firstController = useTextEditingController();
    final passWordController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Michael",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 27,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.inputLabelColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFielColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextFormInput2(
                            controller: firstController,
                            validator: (CurrentValue) {
                              var nonNullValue = CurrentValue ?? '';
                              if (nonNullValue.isEmpty) {
                                return ("username is required");
                              }
                              if (!nonNullValue.contains("@")) {
                                return ("username should contains @");
                              }
                              return null;
                            },
                            obscureText: false,
                            labelText: "Email",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.inputLabelColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFielColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextFormInput2(
                            controller: passWordController,
                            validator: (PassCurrentValue) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              var passNonNullValue = PassCurrentValue ?? "";
                              if (passNonNullValue.isEmpty) {
                                return ("Password is required");
                              } else if (passNonNullValue.length < 6) {
                                return ("Password Must be more than 5 characters");
                              }
                              return null;
                            },
                            obscureText: hidePassword,
                            labelText: "password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey),
                            ),
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
                            child: Text(
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
                    SizedBox(
                      height: 73,
                    ),
                    HookConsumer(builder: ((context, ref, child) {
                      final loginAccount = ref.watch(createAccountProvider);

                      ref.listen<RequestState>(createAccountProvider,
                          (prev, state) {
                        if (state is Loading) {
                          ScreenUtil.showLoadingView(context);
                        } else {
                          ScreenUtil.hideLoadingView(context);
                        }
                        if (state is Success) {
                          context.navigate(MainNavigationScreen());
                        }
                        if (state is Error) {
                          ScreenUtil.showErrorDialog(
                              context, state.error.toString());
                        }
                      });
                      return AuthButton(
                        textColor: Colors.white,
                        icon: loginAccount is Loading
                            ? loadingIcon()
                            : backIcon(),
                        onPressed: loginAccount is Loading
                            ? null
                            : () async {
                                if (firstController.text.isEmpty ||
                                    passWordController.text.isEmpty) {
                                  return;
                                } else if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  var loginUser = LoginRequest(
                                      username: firstController.text,
                                      password: passWordController.text);
                                  ref
                                      .read(createAccountProvider.notifier)
                                      .createAccount(loginUser);

                                  print(loginUser.toJson());
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => MainNavigationScreen(),
                                  //   ),
                                  // );

                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(
                                  //   content: Text('${loginUser.toJson()}'),
                                  //   duration: Duration(seconds: 2),
                                  // ));
                                }
                              },
                      );
                    })),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
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
                    SizedBox(
                      height: 53,
                    ),
                    Text(
                      "-or log in with-",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpNumber(),
                          ),
                        );
                      },
                      child: ContactDetailsContainer(
                          icon: Icons.call, text: "Phone Number"),
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
