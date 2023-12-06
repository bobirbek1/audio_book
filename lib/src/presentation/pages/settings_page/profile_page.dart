import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();
    vm.initTextControllers();
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
          "Profile",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          RegularTextButton(
            onPressed: () {},
            text: "Save",
            size: const Size(10, 10),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size(
            double.infinity,
            1,
          ),
          child: Divider(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: RegularCachedImage(
                    imageUrl: vm.user?.photo,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                    isSquare: true,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 24,
                    icon: Assets.icons.edit.svg(
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            _ProfileItem(
              title: "Full name",
              controller: vm.nameCtrl,
            ),
            const Divider(),
            _ProfileItem(
              title: "Email",
              controller: vm.emailCtrl,
              enable: false,
            ),
            const Divider(),
            _ProfileItem(
              title: "Phone",
              hint: "+998xxxxxxxxx",
              controller: vm.phoneCtrl,
            ),
            const Divider(),
            _ProfileItem(
              title: "Date Birth",
              hint: "Birth Date",
              readOnly: true,
              controller: vm.birthDateCtrl,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? hint;
  final bool enable;
  final bool readOnly;
  const _ProfileItem(
      {required this.title,
      required this.controller,
      this.hint,
      this.readOnly = false,
      this.enable = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textStyles.medium14,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              enabled: enable,
              readOnly: readOnly,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: false,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
