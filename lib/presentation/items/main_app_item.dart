import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/presentation/model/main_app_model.dart';

class MainAppItem extends StatefulWidget {
  final MainAppModel item;

  const MainAppItem({super.key, required this.item});

  @override
  State<MainAppItem> createState() => _MainAppItemState();
}

class _MainAppItemState extends State<MainAppItem> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.75,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          widget.item.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
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
        SizedBox(
          height: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 35),
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
              const SizedBox(width: 35),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.item.screenshots.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 150,
                      child: Card(
                        child: Center(
                          child: Text(
                            widget.item.screenshots[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 35),
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
              const SizedBox(width: 35),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
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
              maxVisibleDots: 7,
              dotWidth: 5,
              dotHeight: 7,
              dotColor: Colors.indigo.shade100,
              activeDotColor: Colors.indigo,
            ),
          ),
        ),
      ],
    );
  }
}
