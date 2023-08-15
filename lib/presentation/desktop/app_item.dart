import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/domain/model/app_model.dart';
import 'package:website/presentation/widgets/app_store_picture.dart';
import 'package:website/presentation/widgets/app_store_qr.dart';
import 'package:website/presentation/widgets/google_play_picture.dart';
import 'package:website/presentation/widgets/google_play_qr.dart';

class AppItem extends StatefulWidget {
  const AppItem({
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
  State<AppItem> createState() => _AppItemState();
}

class _AppItemState extends State<AppItem> {
  final PageController _screenshotPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: AppStyles.mainPaddingHorizontal,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.item.appName,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.item.appDescription,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: AppStoreQR(
                            qrAppStoreName: widget.item.qrAppStore,
                            qrColor: widget.textColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: GooglePlayQR(
                            qrGooglePlayName: widget.item.qrGooglePlay,
                            qrColor: widget.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStorePicture(
                          linkAppStore: widget.item.linkAppStore,
                        ),
                        const SizedBox(width: 16),
                        GooglePlayPicture(
                          linkGooglePlay: widget.item.linkGooglePlay,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _screenshotPageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.count,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset('assets/images/${index + 1}.png');
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _screenshotPageController.previousPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.easeInOutQuad,
                          );
                        },
                        elevation: 0,
                        backgroundColor: widget.textColor,
                        child: const Icon(
                          Icons.arrow_back_ios_sharp,
                        ),
                      ),
                      SmoothPageIndicator(
                        onDotClicked: (index) => _screenshotPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.easeInOutQuad,
                        ),
                        controller: _screenshotPageController,
                        count: widget.count,
                        effect: WormEffect(
                          dotWidth: 12,
                          dotHeight: 12,
                          dotColor: widget.textColor.withOpacity(0.25),
                          activeDotColor: widget.textColor,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _screenshotPageController.nextPage(
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
