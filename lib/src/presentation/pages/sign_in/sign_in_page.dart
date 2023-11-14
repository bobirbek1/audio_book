import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Assets.images.logo.svg(
                width: 120,
                height: 120,
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Log in to your account",
                    style: TextStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _SignInForm(
                emailCtrl: emailCtrl,
                passwordCtrl: passCtrl,
                onValidation: (isValid) {},
              ),
              const _CheckBoxWidget(),
              RegularElevatedButton(
                onPressed: () {},
                text: "Login",
                size: const Size(
                  double.infinity,
                  56,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RegularTextButton(
                    onPressed: () {},
                    text: "Forget Password?",
                    textStyle: TextStyles.semiBold14.copyWith(
                      color: ColorName.accent50,
                    ),
                    foregroundColor: ColorName.accent50,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Or login with",
                style: TextStyles.regular14,
              ),
              const SizedBox(
                height: 20,
              ),
              _SocialMediaButton(
                onPressed: () {},
                icon: Assets.icons.googleIcon.path,
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?  ",
                  style: TextStyles.regular14,
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyles.semiBold14.copyWith(
                        color: ColorName.accent50,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            generateRoute(Pages.signUp)
                          );
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  const _SocialMediaButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RegularOutlineButton(
      onPressed: onPressed,
      size: const Size.fromHeight(56),
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}

class _CheckBoxWidget extends StatefulWidget {
  const _CheckBoxWidget();

  @override
  State<_CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<_CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (value) {
            setState(() {
              isChecked = !isChecked;
            });
          },
          value: isChecked,
          checkColor: ColorName.white,
          activeColor: ColorName.primary50,
          side: const BorderSide(
            color: ColorName.primary20,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
        ),
        const Text(
          "Remember me",
          style: TextStyles.regular14,
        ),
      ],
    );
  }
}

class _SignInForm extends StatelessWidget {
  final TextEditingController emailCtrl;
  final TextEditingController passwordCtrl;
  final void Function(bool isValid) onValidation;
  const _SignInForm({
    required this.emailCtrl,
    required this.passwordCtrl,
    required this.onValidation,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () => onValidation(formKey.currentState?.validate() ?? false),
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
              if (value != null && regExp.hasMatch(value)) {
                return null;
              }
              return "Please enter your email";
            },
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyles.medium14.copyWith(
                color: ColorName.neutral40,
              ),
              fillColor: ColorName.neutral5,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            validator: (value) {
              final regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
              if (value != null) {
                if (regExp.hasMatch(value)) {
                  return null;
                } else if (value.length < 8) {
                  return "Password length must be at least 8";
                }
              }
              return "Password must include letters,numbers";
            },
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyles.medium14.copyWith(
                color: ColorName.neutral40,
              ),
              fillColor: ColorName.neutral5,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
