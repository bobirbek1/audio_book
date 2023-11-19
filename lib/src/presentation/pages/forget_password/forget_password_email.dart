import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';

class ForgetPasswordEmail extends StatelessWidget {
  const ForgetPasswordEmail({super.key});

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
                    "Forget password",
                    style: TextStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Please fill email and we'll send you a link to get back into your account.",
                style: TextStyles.regular14,
              ),
              const SizedBox(
                height: 16,
              ),
              _EmailForm(
                onValidation: (isValid) {
                  // context.read<SignInViewModel>().isFieldsValid = isValid;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const _SubmitButton(),
              const SizedBox(
                height: 16,
              ),
              RegularOutlineButton(
                onPressed: () {},
                size: const Size.fromHeight(56),
                text: "Cancel",
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    // final signIngVM = context.watch<SignInViewModel>();

    // if (signIngVM.state.state == BaseState.error) {
    //   // context.showSnackBar(signIngVM.state.error);
    // }

    return RegularElevatedButton(
      onPressed: () {
        // signIngVM.signIn();
        Navigator.pushReplacement(
          context,
          generateRoute(Pages.forgetPasswordFinish,argument: "test.dev@gmail.com",),
        );
      },
      size: const Size(
        double.infinity,
        56,
      ),
      text: "Submit",
    );

    // switch (signIngVM.state.state) {
    //   BaseState.loading => const RegularElevatedButton(
    //       onPressed: null,
    //       size: Size(
    //         double.infinity,
    //         56,
    //       ),
    //       child: CircularProgressIndicator.adaptive(),
    //     ),
    //   _ => RegularElevatedButton(
    //       onPressed: () {
    //         signIngVM.signIn();
    //       },
    //       size: const Size(
    //         double.infinity,
    //         56,
    //       ),
    //       text: "Login",
    //     ),
    // };
  }
}

class _EmailForm extends StatelessWidget {
  final void Function(bool isValid) onValidation;
  const _EmailForm({
    required this.onValidation,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () => onValidation(formKey.currentState?.validate() ?? false),
      child: TextFormField(
        validator: (value) {
          final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
          if (value != null && regExp.hasMatch(value)) {
            return null;
          }
          return "Please enter your email";
        },
        keyboardType: TextInputType.emailAddress,
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
    );
  }
}
