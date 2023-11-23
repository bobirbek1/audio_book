import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordFinish extends StatelessWidget {
  const ForgetPasswordFinish({super.key});

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments?.toString() ?? "";
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
                    "Email sent",
                    style: Theme.of(context).textStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                    text: "We sent an email to ",
                    style: Theme.of(context).textStyles.regular14,
                    children: [
                      TextSpan(
                        text: email,
                        style: Theme.of(context).textStyles.semiBold14,
                      ),
                      TextSpan(
                        text: " with a link to get back into your account.",
                        style: Theme.of(context).textStyles.regular14,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 24,
              ),
              RegularOutlineButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
