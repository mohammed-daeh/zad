// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/featuers/dua/presentation/controllers/morning_azkar_state.dart';

class MorningDuaView extends ConsumerWidget {
  const MorningDuaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(morningAzkarProvider);
    final controller = ref.read(morningAzkarProvider.notifier);

    final duas = [
      "اللهم إني أسالك خير هذا اليوم، فتحه، ونصره، ونوره، وبركته، وهداه.",
      "اللهم بك أصبحنا، وبك أمسينا، وبك نحيا، وبك نموت، وإليك المصير.",
      "اللهم اجعل صباحي هذا خيرًا، وبارك لي في يومي هذا، وارزقني فيه من الخير ما لا أحصيه.",
      "اللهم إني أعوذ بك من همزات الشياطين وأعوذ بك ربي أن يحضرون.",
      "اللهم إني أسألك رحمتك التي وسعت كل شيء، وأن تجعل صباحي هذا بداية لفرحٍ وسعادة.",
      "اللهم ارزقني في هذا الصباح سعادة لا تنتهي، وراحة بال لا تزول.",
      "اللهم اجعل صباحي هذا بداية لتغيير حياتي للأفضل، وأبعد عني كل ما يعيق تقدمي.",
      "اللهم اجعل يومي هذا خاليًا من الهموم، مليئًا بالفرح والطمأنينة.",
      "اللهم إني أسالك في هذا الصباح أن تسهل لي أموري، وتبارك لي في عملي، وترزقني من حيث لا أحتسب.",
      "اللهم اجعل صباحي هذا بداية خير وفرح، ووفقني في كل خطوة أخطوها.",
      "لقد انهيت جميع اذكار الصباح .. بارك الله بك."
    ];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: myLinearGradient),
          ),
          Positioned(
            left: 0,
            child: SvgPicture.asset(
              'assets/images/khatamPage/zagrafa_horizontal.svg',
            ),
          ),
          Positioned(
            top: 55,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/khatamPage/arrow_back_white.svg',
                    width: 16,
                    height: 16,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'morning Dua',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/duaPage/sound.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        controller.resetProgress();
                      },
                      child: SvgPicture.asset(
                        'assets/images/duaPage/refresh.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(
                      'assets/images/duaPage/setting.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 90,
            child: Container(
              color: Color(0xffFFF2E5),
              height: 8,
              child: LinearProgressIndicator(
                value: state.progress,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(10)),
                backgroundColor: const Color(0xffFFF2E5),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xffDEA56E)),
              ),
            ),
          ),
          Positioned(
            top: 98,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 16,
                left: 15,
                right: 15,
                bottom: 110,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffE0ECEE),
                  ),
                  color: Color(0xffE0ECEE),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    textAlign: TextAlign.center,
                    duas[state.currentDuaIndex],
                    style: TextStyle(
                      color: Color(0xff345870),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 115,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
              child: SvgPicture.asset(
                'assets/images/duaPage/zagrafa_corner_top_right2.svg',
                width: 90,
                height: 90,
                color: AppColors.primary.withAlpha(155),
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            left: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
              child: SvgPicture.asset(
                'assets/images/duaPage/zagrafa_corner_bottom_left.svg',
                width: 90,
                height: 90,
                color: AppColors.primary.withAlpha(155),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 30,
            child: Stack(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xffE0ECEE), width: 1),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 120,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 7,
                                color: Colors.white,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                controller.nextDua();
                                if (state.currentDuaIndex ==
                                    state.totalDuas - 1) {
                                  BotToast.showText(
                                      text: "تهانينا! لقد أنهيت جميع الأذكار.");
                                }
                              },
                              child: ProgressWithText(
                                progress: state.progress,
                                text:
                                    '${state.currentDuaIndex + 1} / ${state.totalDuas}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

class ProgressWithText extends StatelessWidget {
  final double progress;
  final String text;

  const ProgressWithText({
    super.key,
    required this.progress,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: CircularProgressIndicator(
            value: progress, 
            strokeWidth: 10,
            strokeCap: StrokeCap.round,
            backgroundColor: const Color(0xffE0ECEE),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff124D73)),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff124D73),
          ),
        ),
      ],
    );
  }
}
