import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/application/strings/app_strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
            splashRadius: 15,
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.all(25),
                child: Card(
                  color: Colors.brown.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Container(
                height: 500,
                color: Colors.red.shade50,
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                controller: _pageController,
                                padEnds: false,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: Text('Yes $index'),
                                  );
                                },
                                onPageChanged: (page) {},
                              ),
                            ),
                            const SizedBox(height: 25),
                            SmoothPageIndicator(
                              onDotClicked: (index) =>
                                  _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.bounceIn,
                              ),
                              controller: _pageController,
                              count: 10,
                              effect: ScrollingDotsEffect(
                                maxVisibleDots: 7,
                                dotWidth: 5,
                                dotHeight: 7,
                                dotColor: Colors.white,
                                activeDotColor: Colors.brown.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 500,
                color: Colors.blue.shade50,
                child: const Center(
                  child: Text("First block"),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 500,
                color: Colors.blueGrey.shade50,
                child: const Center(
                  child: Text("First block"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
