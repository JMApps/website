import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/presentation/model/main_app_model.dart';

class AppScreenshotsPhone extends StatefulWidget {
  const AppScreenshotsPhone({super.key, required this.item});

  final MainAppModel item;

  @override
  State<AppScreenshotsPhone> createState() => _AppScreenshotsPhoneState();
}

class _AppScreenshotsPhoneState extends State<AppScreenshotsPhone> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xBFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        height: 500,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.item.appScreen.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.network(
                      '${AppStrings.appLinkForApi}${widget.item.appScreen[index]['screen']}',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: AppStyles.mainPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 8),
                  FloatingActionButton.small(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.bounceIn,
                      );
                    },
                    backgroundColor: Colors.indigo,
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const SizedBox(width: 8),
                  SmoothPageIndicator(
                    onDotClicked: (index) => _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.bounceIn,
                    ),
                    controller: _pageController,
                    count: widget.item.appScreen.length,
                    effect: ScrollingDotsEffect(
                      maxVisibleDots: 5,
                      dotWidth: 7.5,
                      dotHeight: 7.5,
                      dotColor: Colors.indigo.shade100,
                      activeDotColor: Colors.indigo,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton.small(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.bounceIn,
                      );
                    },
                    backgroundColor: Colors.indigo,
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
