import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:audio_book/src/presentation/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
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
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          fixedSize: const Size.fromHeight(56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          foregroundColor: ColorName.primary50),
                      child: Text("Skip",
                          textAlign: TextAlign.center,
                          style: TextStyles.medium16
                              .copyWith(color: ColorName.primary50)),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (pageController.page == 2) {
                          return;
                        }
                        pageController.animateToPage(
                            pageController.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.ease);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          backgroundColor: ColorName.primary50),
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyles.medium16
                            .copyWith(color: ColorName.white),
                      ),
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
            style: TextStyles.semiBold16.copyWith(color: ColorName.neutral80),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.regular14.copyWith(
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
