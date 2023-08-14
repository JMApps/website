import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/presentation/desktop/app_model.dart';
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
      width: double.infinity,
      height: double.infinity,
      color: widget.backgroundColor,
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
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  maxLines: 50,
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
                        AppStorePicture(linkAppStore: widget.item.linkAppStore),
                        const SizedBox(width: 16),
                        GooglePlayPicture(
                            linkGooglePlay: widget.item.linkGooglePlay),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(36),
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
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton.small(
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
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.easeInOutQuad,
                        ),
                        controller: _screenshotPageController,
                        count: widget.count,
                        effect: ExpandingDotsEffect(
                          dotWidth: 12,
                          dotHeight: 8,
                          dotColor: widget.textColor.withOpacity(0.25),
                          activeDotColor: widget.textColor,
                        ),
                      ),
                      FloatingActionButton.small(
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
