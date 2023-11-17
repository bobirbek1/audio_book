import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:audio_book/src/presentation/view_models/sign_up_view_model.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Register",
                    style: TextStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _SignUpForm(
                onValidation: (isValid) {
                  context.read<SignUpViewModel>().isFieldValid = isValid;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const _PrivacyPolicyText(),
              const SizedBox(
                height: 16,
              ),
              RegularElevatedButton(
                onPressed: () {
                  context.read<SignUpViewModel>().signUp();
                },
                text: "Register",
                size: const Size(
                  double.infinity,
                  56,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RegularOutlineButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Cancel",
                size: const Size.fromHeight(56),
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

class _PrivacyPolicyText extends StatelessWidget {
  const _PrivacyPolicyText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "By singing up, you agree to our ",
          style: TextStyles.regular14,
          children: [
            TextSpan(
              text: "Terms",
              style: TextStyles.semiBold14.copyWith(
                color: ColorName.accent50,
              ),
            ),
            const TextSpan(
              text: ", ",
              style: TextStyles.regular14,
            ),
            TextSpan(
              text: "Data policy",
              style: TextStyles.semiBold14.copyWith(
                color: ColorName.accent50,
              ),
            ),
            const TextSpan(
              text: " and ",
              style: TextStyles.regular14,
            ),
            TextSpan(
              text: "Cookies Policy",
              style: TextStyles.semiBold14.copyWith(
                color: ColorName.accent50,
              ),
            ),
            const TextSpan(
              text: ".",
              style: TextStyles.regular14,
            ),
          ]),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  final void Function(bool isValid) onValidation;
  const _SignUpForm({
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
            controller: context.read<SignUpViewModel>().nameCtrl,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              }
              return "Please enter your fullname";
            },
            decoration: InputDecoration(
              hintText: "Fullname",
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
            controller: context.read<SignUpViewModel>().emailCtrl,
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
            controller: context.read<SignUpViewModel>().passCtrl,
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
