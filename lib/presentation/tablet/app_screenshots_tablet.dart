import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/presentation/model/main_app_model.dart';

class AppScreenshotsTablet extends StatefulWidget {
  const AppScreenshotsTablet({super.key, required this.item});

  final MainAppModel item;

  @override
  State<AppScreenshotsTablet> createState() => _AppScreenshotsTabletState();
}

class _AppScreenshotsTabletState extends State<AppScreenshotsTablet> {
  final PageController _pageController = PageController(viewportFraction: 0.65);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xBFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        height: 750,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.bounceIn,
                      );
                    },
                    backgroundColor: Colors.indigo,
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.item.screenshots.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          'assets/screenshots/${widget.item.screenshots[index]}.png',
                          fit: BoxFit.fitHeight,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.bounceIn,
                      );
                    },
                    backgroundColor: Colors.indigo,
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                onDotClicked: (index) => _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.bounceIn,
                ),
                controller: _pageController,
                count: widget.item.screenshots.length,
                effect: ScrollingDotsEffect(
                  maxVisibleDots: 5,
                  dotWidth: 7.5,
                  dotHeight: 7.5,
                  dotColor: Colors.indigo.shade100,
                  activeDotColor: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
