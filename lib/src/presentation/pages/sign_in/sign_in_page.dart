import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/sign_in_view_model.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                    "Log in to your account",
                    style: Theme.of(context).textStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _SignInForm(
                onValidation: (isValid) {
                  context.read<SignInViewModel>().isFieldsValid = isValid;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const _LoginButton(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RegularTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        generateRoute(
                          Pages.forgetPasswordEmail,
                        ),
                      );
                    },
                    text: "Forget Password?",
                    textStyle: Theme.of(context).textStyles.semiBold14.copyWith(
                          color: ColorName.accent50,
                        ),
                    foregroundColor: ColorName.accent50,
                    size: const Size(100, 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Or login with",
                style: Theme.of(context).textStyles.regular14,
              ),
              const SizedBox(
                height: 20,
              ),
              _SocialMediaButton(
                onPressed: () {
                  context.read<SignInViewModel>().signInWithGoogle();
                },
                icon: Assets.icons.googleIcon.path,
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?  ",
                  style: Theme.of(context).textStyles.regular14,
                  children: [
                    TextSpan(
                      text: "Register",
                      style: Theme.of(context).textStyles.semiBold14.copyWith(
                            color: ColorName.accent50,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, generateRoute(Pages.signUp));
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final signInVM = context.watch<SignInViewModel>();

    if (signInVM.state.state == BaseState.error) {
      context.showSnackBar(signInVM.state.error);
    }

    if (signInVM.state.user != null) {
      context.read<UserViewModel>().getUser(signInVM.state.user!.uid).then((value) {
        Navigator.pushAndRemoveUntil(context, generateRoute(Pages.mainPage),(route) => false);
      });
    }

    return switch (signInVM.state.state) {
      BaseState.loading => const RegularElevatedButton(
          onPressed: null,
          size: Size(
            double.infinity,
            56,
          ),
          child: CircularProgressIndicator.adaptive(),
        ),
      _ => RegularElevatedButton(
          onPressed: () {
            signInVM.signIn();
          },
          size: const Size(
            double.infinity,
            56,
          ),
          text: "Login",
        ),
    };
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  const _SocialMediaButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    final signInVM = context.watch<SignInViewModel>();
    final userVM = context.read<UserViewModel>();
    final state = signInVM.googleState;
    if (state.state == BaseState.error) {
      context.showSnackBar(state.error);
    }

    if (state.user != null) {
      userVM.getUser(state.user!.uid).then((value) {
        if (userVM.user == null) {
          final user = state.user!;
          final userModel = UserModel(
            uid: user.uid,
            fullName: user.displayName,
            email: user.email,
            photo: user.photoURL,
          );
          userVM.saveUser(userModel);
        }
        Navigator.pushAndRemoveUntil(context, generateRoute(Pages.mainPage),(route) => false);
      });
    }

    return switch (signInVM.googleState.state) {
      BaseState.loading => RegularOutlineButton(
          onPressed: onPressed,
          size: const Size.fromHeight(56),
          child: const CircularProgressIndicator.adaptive()),
      _ => RegularOutlineButton(
          onPressed: onPressed,
          size: const Size.fromHeight(56),
          child: SvgPicture.asset(
            icon,
          ),
        )
    };
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
        Text(
          "Remember me",
          style: Theme.of(context).textStyles.regular14,
        ),
      ],
    );
  }
}

class _SignInForm extends StatelessWidget {
  final void Function(bool isValid) onValidation;
  const _SignInForm({
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
            controller: context.read<SignInViewModel>().emailCtrl,
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
            controller: context.read<SignInViewModel>().passCtrl,
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
