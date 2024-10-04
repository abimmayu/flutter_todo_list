import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/routing/router.dart';
import 'package:todo_list/core/utils/colors.dart';
import 'package:todo_list/core/utils/font.dart';
import 'package:todo_list/feature/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:todo_list/feature/login/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.today_rounded, size: 100.h),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
              child: TextFieldWidgets(
                controller: usernameController,
                hintText: 'Username',
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              child: TextFieldWidgets(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              child: TextFieldWidgets(
                controller: emailController,
                hintText: 'Email',
                onChanged: (value) {},
              ),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.pushReplacementNamed(AppRoute.loginScreen.name);
                }
                log("$state");
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.darkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                  ),
                  onPressed: () {
                    log(usernameController.text);
                    log(passwordController.text);
                    log(emailController.text);
                    context.read<AuthBloc>().add(
                          AuthRegister(
                            username: usernameController.text,
                            password: passwordController.text,
                            email: emailController.text,
                          ),
                        );
                  },
                  child: Text(
                    'Register',
                    style: AppTextStyle.normalText.copyWith(
                      color: AppColor.backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
