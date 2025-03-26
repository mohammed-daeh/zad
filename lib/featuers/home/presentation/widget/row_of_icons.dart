// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/scroll_controller_x.dart';

// class IconWithLabel extends StatelessWidget {
//   final String iconPath;
//   final String label;

//   const IconWithLabel({
//     super.key,
//     required this.iconPath,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 14.0),
//       child: SizedBox(
//         height: 68,
//         width: 54,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               iconPath,
//               height: 40,
//               width: 40,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 8),
//             Text(
//               label.i18n,
//               style: TextStyle(
//                 color: Color(0xff062437),
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 letterSpacing: 0.1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:zad_almuslem/featuers/home/presentation/controllers/scroll_controller_x.dart';

class IconWithLabel extends StatelessWidget {
  final String iconPath;
  final String label;

  const IconWithLabel({
    super.key,
    required this.iconPath,
    required this.label,
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
            SvgPicture.asset(
              iconPath,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              label,
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
              ref.read(scrollOffsetProvider.notifier).updateScroll(notification.metrics.pixels);
            }
            return true;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                IconWithLabel(iconPath: 'assets/icons/player.svg', label: 'prayer'),
                IconWithLabel(iconPath: 'assets/icons/qibla.svg', label: 'qibla'),
                IconWithLabel(iconPath: 'assets/icons/hadith.svg', label: 'hadith'),
                IconWithLabel(iconPath: 'assets/icons/tesbih.svg', label: 'tesbih'),
                IconWithLabel(iconPath: 'assets/icons/podcast.svg', label: 'podcast'),
                IconWithLabel(iconPath: 'assets/icons/videos.svg', label: 'videos'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 4,
          color: const Color(0xffE0ECEE),
          child: Consumer(
            builder: (context, ref, child) {
              double scrollOffset = ref.watch(scrollOffsetProvider);
              double percentage = (scrollOffset > 0) ? scrollOffset / 200.0 : 0; // تعيين قيمة maxScroll يدوياً
              double scrollBarPosition = (percentage * (60 - 40)).clamp(0.0, 20.0);

              return Stack(
                children: [
                  if (scrollOffset > 0)
                    const Positioned(
                      left: 0,
                      child: Icon(Icons.arrow_left),
                    ),
                  Container(
                    margin: EdgeInsets.only(left: scrollBarPosition),
                    decoration: BoxDecoration(
                      color: const Color(0xff124D73),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 40,
                    height: 4,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
