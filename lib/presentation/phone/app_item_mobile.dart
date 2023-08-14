import 'package:flutter/material.dart';
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(
                fontSize: 18,
              ),
              maxLines: 50,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 8),
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
              const SizedBox(width: 8),
              Expanded(
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
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 16),
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
                  const SizedBox(width: 8),
                  GooglePlayPicture(linkGooglePlay: widget.item.linkGooglePlay),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
