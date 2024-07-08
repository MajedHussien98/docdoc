import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/core/widgets/app_text_from_field.dart';
import 'package:doctor/core/widgets/app_text_button.dart';
import 'package:doctor/features/auth/login/ui/widgets/dont_have_account_text.dart';
import 'package:doctor/features/auth/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text(
                'Welcome Back',
                style: TextStyles.font24PrimaryBold,
              ),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular.copyWith(height: 1.8),
              ),
              verticalSpace(36),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const AppTextFromField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    verticalSpace(16),
                    AppTextFromField(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: _isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscureText = !_isObscureText;
                          });
                        },
                        child: Icon(_isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    verticalSpace(16),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font12PrimaryRegular,
                      ),
                    ),
                    verticalSpace(36),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemibold,
                      onPressed: () {},
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
