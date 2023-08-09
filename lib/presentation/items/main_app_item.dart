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
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1 / 3);

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
          height: 450,
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
                    return Image.asset(
                      'assets/screenshots/${widget.item.screenshots[index]}.png',
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
              maxVisibleDots: 7,
              dotWidth: 5,
              dotHeight: 7,
              dotColor: Colors.indigo.shade100,
              activeDotColor: Colors.indigo,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'СКАЧАТЬ ПРИЛОЖЕНИЕ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/app_store.png', width: 150),
                const SizedBox(width: 16),
                Image.asset('assets/icons/google_play.png', width: 150),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Скачиваний',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Оценка',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(indent: 16, endIndent: 16),
          ],
        ),
      ],
    );
  }
}
