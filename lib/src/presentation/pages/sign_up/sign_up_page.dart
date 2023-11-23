import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/sign_up_view_model.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textStyles.semiBold16,
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
              const _RegisterButton(),
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

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final signUpVM = context.watch<SignUpViewModel>();

    if (signUpVM.state.state == BaseState.error) {
      context.showSnackBar(signUpVM.state.error);
    }

    if (signUpVM.state.user != null) {
      final user = signUpVM.state.user!;
      final userModel = UserModel(
        uid: user.uid,
        fullName: user.displayName ?? signUpVM.nameCtrl.text,
        email: user.email,
      );
      context.read<UserViewModel>().saveUser(userModel);
    }

    return switch (signUpVM.state.state) {
      BaseState.loading => const RegularElevatedButton(
          onPressed: null,
          size: Size(
            double.infinity,
            56,
          ),
          child: CircularProgressIndicator.adaptive(),
        ),
      BaseState.loaded => RegularElevatedButton(
          onPressed: () {},
          text: "Register",
          size: const Size(
            double.infinity,
            56,
          ),
        ),
      _ => RegularElevatedButton(
          onPressed: () {
            context.read<SignUpViewModel>().signUp();
          },
          text: "Register",
          size: const Size(
            double.infinity,
            56,
          ),
        ),
    };
  }
}

class _PrivacyPolicyText extends StatelessWidget {
  const _PrivacyPolicyText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "By singing up, you agree to our ",
          style: Theme.of(context).textStyles.regular14,
          children: [
            TextSpan(
              text: "Terms",
              style: Theme.of(context).textStyles.semiBold14.copyWith(
                color: ColorName.accent50,
              ),
            ),
            TextSpan(
              text: ", ",
              style: Theme.of(context).textStyles.regular14,
            ),
            TextSpan(
              text: "Data policy",
              style: Theme.of(context).textStyles.semiBold14.copyWith(
                color: ColorName.accent50,
              ),
            ),
            TextSpan(
              text: " and ",
              style: Theme.of(context).textStyles.regular14,
            ),
            TextSpan(
              text: "Cookies Policy",
              style: Theme.of(context).textStyles.semiBold14.copyWith(
                color: ColorName.accent50,
              ),
            ),
            TextSpan(
              text: ".",
              style: Theme.of(context).textStyles.regular14,
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
            decoration: const InputDecoration(
              hintText: "Fullname",
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
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
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
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
        ],
      ),
    );
  }
}
