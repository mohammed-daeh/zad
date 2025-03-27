// ignore_for_file: avoid_print

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/scroll_controller_x.dart';

class IconWithLabel extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const IconWithLabel({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: SizedBox(
        height: 68,
        width: 54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                iconPath,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label.i18n,
              style: const TextStyle(
                color: Color(0xff062437),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconRowWidget extends ConsumerWidget {
  const IconRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController = ScrollController();

    return Column(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollUpdateNotification) {
              ref
                  .read(scrollOffsetProvider.notifier)
                  .updateScroll(notification.metrics.pixels);
            }
            return true;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconWithLabel(
                  onTap: () {
                    context.push('/Prayer');
                  },
                  iconPath: 'assets/icons/player.svg',
                  label: 'prayer',
                ),
                IconWithLabel(
                  onTap: () {
                    context.push('/Qibla');
                  },
                  iconPath: 'assets/icons/qibla.svg',
                  label: 'qibla',
                ),
                IconWithLabel(
                  onTap: () {
                    BotToast.showText(text: "coming soon");
                  },
                  iconPath: 'assets/icons/hadith.svg',
                  label: 'hadith',
                ),
                IconWithLabel(
                  onTap: () {
                    context.push('/Tasbih');
                  },
                  iconPath: 'assets/icons/tesbih.svg',
                  label: 'tesbih',
                ),
                IconWithLabel(
                  onTap: () {
                    BotToast.showText(text: "coming soon");
                  },
                  iconPath: 'assets/icons/videos.svg',
                  label: 'videos',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
