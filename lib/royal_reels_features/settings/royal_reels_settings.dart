import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';
import 'package:royal_reels/core/helpers/snack_bar_helper.dart';
import 'package:royal_reels/core/services/platform_service.dart';
import 'package:royal_reels/core/utilities/app_button.dart';
import 'package:royal_reels/core/utilities/border.dart';
import 'package:royal_reels/royal_reels_constants.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/royal_reels_icon_button.dart';

class RoyalReelsSettings extends StatelessWidget {
  const RoyalReelsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SettingsAppbar(),
          const RoyalReelsAvatarWidget(),
          AppButton(
            onTap: () {
              'af'.log();
              PlatformService.sendToUrl(RoyalReelsConstants.privacyPolicy);
            },
            title: 'Privacy Policy',
            margin: 50.w.horizPad,
          ),
        ],
      ),
    );
    // :)
  }
}

class RoyalReelsAvatarWidget extends StatefulWidget {
  const RoyalReelsAvatarWidget({super.key});

  @override
  State<RoyalReelsAvatarWidget> createState() => _RoyalReelsAvatarWidgetState();
}

class _RoyalReelsAvatarWidgetState extends State<RoyalReelsAvatarWidget> {
  @override
  void initState() {
    future = checkImage();
    super.initState();
  }

  Future<bool> checkImage() async {
    await setCachePath();
    final file = File('$cachPath$imageName');
    final val = await file.exists();
    addIcon.value = !val;
    return val;
  }

  Future<void> chooseImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) {
      return;
    }
    try {
      final image = await xFile.readAsBytes();
      final file = File('$cachPath$imageName');
      if (await file.exists()) {
        await file.create();
      }
      await file.writeAsBytes(image);
      setState(() {
        hasError = false;
      });
      addIcon.value = false;
    } catch (e) {
      SnackBarHelper.showTopSnack(title: 'Image type is not supported');
    }
  }

   Future<bool>? future;
   String? cachPath;

  Future<void> setCachePath() async {
    final cacheDir = await getTemporaryDirectory();
    cachPath = cacheDir.path;
  }

  final String imageName = 'avatat.png';
  Widget get defChild => CircleAvatar(
        key: UniqueKey(),
        backgroundColor: AppColors.royalReelsDarkGrey,
        child: SvgPicture.asset(
          'assets/images/avatar.svg',
        ),
      );

  var hasError = false;
  final addIcon = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 45.h.verticPad,
      child: SizedBox.square(
        dimension: 140.sp,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: chooseImage,
              child: BorderWidget(
                shape: BoxShape.circle,
                color: AppColors.royalReelsOrange,
                width: 2.sp,
                child: SizedBox.expand(
                  child: FutureBuilder<bool>(
                    future: future,
                    builder: (context, snap) {
                      snap.connectionState.log();
                      if (snap.connectionState == ConnectionState.done &&
                          !hasError) {
                        return CircleAvatar(
                          key: UniqueKey(),
                          backgroundColor: AppColors.royalReelsDarkGrey,
                          foregroundImage: FileImage(
                            File('$cachPath$imageName'),
                          ),
                          onForegroundImageError: (exception, stackTrace) {
                            setState(() {
                              hasError = true;
                            });
                          },
                        );
                      }
                      return defChild;
                    },
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: addIcon,
              builder: (context, val, _) {
                if (!val) return SizedBox();
                return Align(
                  alignment: Alignment(1, 0.9),
                  child: RoyalReelsIconButton(
                    onTap: () {},
                    size: 40.sp,
                    iconPath: 'assets/icons/plus.svg',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.royalReelsDarkBlue,
      child: Padding(
        padding: PlatformService.topPadding.topPad
            .add(6.h.verticPad.add(24.w.horizPad)),
        child: SizedBox(
          width: double.infinity,
          height: 62.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Pathes.royalReelsLogoText,
                height: 32.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RoyalReelsIconButton(
                  iconPath: Pathes.royalReelsArrowBackIcon,
                  size: 44.sp,
                  onTap: context.pop,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
