import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: Assets.icons.arrowLeft.svg(),
        ),
        centerTitle: true,
        title: const Text(
          "Settings",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        bottom: const PreferredSize(
          preferredSize: Size(
            double.infinity,
            1,
          ),
          child: Divider(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _ProfileItem(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 28,
            height: 28,
          ),
          const _SettingItem(
            title: "Notifications",
          ),
          const Divider(),
          const _SettingItem(title: "Data and Storage"),
          const Divider(
            thickness: 28,
            height: 28,
          ),
          const _SettingItem(title: "Subscription"),
          const Divider(),
          const _SettingItem(title: "Linked Account"),
          const Divider(
            thickness: 28,
            height: 28,
          ),
          const _SettingItem(title: "About Audibooks"),
          const Divider(),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RegularOutlineButton(
              onPressed: () {
                context.read<UserViewModel>().logOut().then((value) {
                  if (value) {
                    Navigator.pushAndRemoveUntil(
                        context, generateRoute(Pages.signIn), (route) => false);
                  } else {
                    if (context.mounted) {
                      context.showSnackBar("User log out unsuccessfully. Please try again!");
                    }
                  }
                });
              },
              text: "Log out",
              foregroundColor: ColorName.accent50,
              borderColor: ColorName.accent50,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const _SettingItem({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Text(
          title,
          style: Theme.of(context).textStyles.regular14,
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          generateRoute(
            Pages.profilePage,
          ),
        );
      },
      borderRadius: BorderRadius.circular(18),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: RegularCachedImage(
              imageUrl: vm.user?.photo,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              isSquare: true,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vm.user?.fullName ?? "Unknown",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textStyles.medium16,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "View profile",
                  style: Theme.of(context).textStyles.regular12.copyWith(
                        color: ColorName.primary50,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
