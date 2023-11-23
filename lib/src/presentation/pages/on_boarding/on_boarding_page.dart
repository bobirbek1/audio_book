import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/presentation/widgets/page_indicator.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    context.read<UserViewModel>().makeUserNotFirst();
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.bgPatternLight.image(
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    _PageItem(
                      title: "Title one",
                      subtitle:
                          "Lorem ipsum dolor sit amet la maryame dor sut colondeum.",
                      svgPath: Assets.images.people.path,
                    ),
                    _PageItem(
                      title: "Title one",
                      subtitle:
                          "Lorem ipsum dolor sit amet la maryame dor sut colondeum.",
                      svgPath: Assets.images.people.path,
                    ),
                    _PageItem(
                      title: "Title one",
                      subtitle:
                          "Lorem ipsum dolor sit amet la maryame dor sut colondeum.",
                      svgPath: Assets.images.people.path,
                    ),
                  ],
                ),
              ),
              PageIndicator(controller: pageController),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: RegularTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, generateRoute(Pages.signIn));
                      },
                      size: const Size.fromHeight(56),
                      text: "Skip",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: RegularElevatedButton(
                      onPressed: () {
                        if (pageController.page == 2) {
                          Navigator.pushReplacement(
                              context, generateRoute(Pages.signIn));
                        }
                        pageController.animateToPage(
                            pageController.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.ease);
                      },
                      size: const Size.fromHeight(56),
                      text: "Next",
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PageItem extends StatelessWidget {
  final String svgPath;
  final String title;
  final String subtitle;

  const _PageItem(
      {required this.title, required this.subtitle, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            svgPath,
            fit: BoxFit.contain,
            width: 260,
            height: 260,
          ),
          const SizedBox(
            height: 23,
          ),
          Text(
            title,
            style: Theme.of(context).textStyles.semiBold16,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textStyles.regular14.copyWith(
              color: ColorName.neutral80,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
