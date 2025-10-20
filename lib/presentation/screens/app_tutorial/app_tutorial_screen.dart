import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Dolore exercitation id aute dolore qui laborum culpa.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption:
        'Do non incididunt et est reprehenderit elit minim excepteur magna officia tempor.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Reprehenderit qui incididunt commodo ea reprehenderit minim duis consequat.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            top: 80,
            right: 30,
            child: TextButton(onPressed: context.pop, child: Text('Skip')),
          ),

          endReached
              ? Positioned(
                  bottom: 50,
                  right: 30,
                  child: FilledButton(
                    onPressed: context.pop,
                    child: Text('Comenzar'),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 30),
            Text(title, style: titleStyle),
            SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
