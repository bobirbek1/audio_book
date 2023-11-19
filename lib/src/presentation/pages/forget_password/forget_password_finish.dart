import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email sent",
                    style: TextStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                    text: "We sent an email to ",
                    style: TextStyles.regular14,
                    children: [
                      TextSpan(
                        text: email,
                        style: TextStyles.semiBold14,
                      ),
                      const TextSpan(
                        text: " with a link to get back into your account.",
                        style: TextStyles.regular14,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 24,
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
