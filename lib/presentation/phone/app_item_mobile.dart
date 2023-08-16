import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/domain/model/app_model.dart';
import 'package:website/presentation/widgets/app_store_picture.dart';
import 'package:website/presentation/widgets/app_store_qr.dart';
import 'package:website/presentation/widgets/google_play_picture.dart';
import 'package:website/presentation/widgets/google_play_qr.dart';

class AppItemMobile extends StatefulWidget {
  const AppItemMobile({
    super.key,
    required this.item,
    required this.backgroundColor,
    required this.textColor,
    required this.count,
  });

  final AppModel item;
  final Color backgroundColor;
  final Color textColor;
  final int count;

  @override
  State<AppItemMobile> createState() => _AppItemMobileState();
}

class _AppItemMobileState extends State<AppItemMobile> {
  final PageController _screenshotPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: AppStyles.mainPaddingHorizontalMini,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            widget.item.appName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            widget.item.appDescription,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(width: 8),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 500,
                  child: PageView.builder(
                    controller: _screenshotPageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.count,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset('assets/images/${index + 1}.png');
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: FloatingActionButton.small(
                  onPressed: () async {
                    await _screenshotPageController.previousPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOutQuad,
                    );
                  },
                  elevation: 0,
                  backgroundColor: widget.textColor,
                  child: const Icon(
                    Icons.arrow_back_ios_sharp
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton.small(
                  onPressed: () async {
                    await _screenshotPageController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOutQuad,
                    );
                  },
                  elevation: 0,
                  backgroundColor: widget.textColor,
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SmoothPageIndicator(
            onDotClicked: (index) => _screenshotPageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeInOutQuad,
            ),
            controller: _screenshotPageController,
            count: widget.count,
            effect: WormEffect(
              dotWidth: 8,
              dotHeight: 8,
              dotColor: widget.textColor.withOpacity(0.25),
              activeDotColor: widget.textColor,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 125,
                    width: 125,
                    child: AppStoreQR(
                      qrAppStoreName: widget.item.qrAppStore,
                      qrColor: widget.textColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 125,
                    width: 125,
                    child: GooglePlayQR(
                      qrGooglePlayName: widget.item.qrGooglePlay,
                      qrColor: widget.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 125,
                    child: AppStorePicture(
                      linkAppStore: widget.item.linkAppStore,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 125,
                    child: GooglePlayPicture(
                      linkGooglePlay: widget.item.linkGooglePlay,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
