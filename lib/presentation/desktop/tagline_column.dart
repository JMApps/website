import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website/application/colors/custom_colors.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/domain/model/tagline_model.dart';
import 'package:website/domain/tagline_bloc.dart';

class TagLineColumn extends StatefulWidget {
  final TagLineBloc tagLineBloc;

  const TagLineColumn({super.key, required this.tagLineBloc});

  @override
  State<TagLineColumn> createState() => _TagLineColumnState();
}

class _TagLineColumnState extends State<TagLineColumn> {
  final PageController _taglinePageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TagLineModel>>(
      future: widget.tagLineBloc.getLoadTagLines,
      builder: (BuildContext context, AsyncSnapshot<List<TagLineModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _taglinePageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.tagLineBloc.getTagLines.length,
                  itemBuilder: (BuildContext context, int index) {
                    final TagLineModel item = snapshot.data![index];
                    return Card(
                      margin: AppStyles.mainMarginMini,
                      shape: AppStyles.mainShape,
                      color: CustomColors.mainAppLightColors[index],
                      child: Center(
                        child: ListTile(
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            item.subTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                onDotClicked: (index) => _taglinePageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.bounceIn,
                ),
                controller: _taglinePageController,
                count: widget.tagLineBloc.getTagLines.length,
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: Colors.grey,
                  activeDotColor: CustomColors.mainAppDarkColors[0],
                ),
              ),
              const SizedBox(height: 8),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainPadding,
              child: Text(
                snapshot.error.toString(),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
