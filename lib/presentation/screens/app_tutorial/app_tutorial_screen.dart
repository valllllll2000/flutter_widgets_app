import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Look for food',
      caption:
          'A framework for building beautiful, natively compiled applications from a single codebase. Support is available for Material Design 3.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Fast delivery',
      caption:
          'Material Design is an adaptable system of guidelines, components, and tools that support the best practices of user interface design. Backed by open-source code, Material Design streamlines collaboration between designers and developers, and helps teams quickly build beautiful products.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Enjoy your food',
      caption:
          "In addition to the online sites above, Flutter's documentation can be downloaded as an HTML documentation ZIP file for use when offline or when you have a poor internet connection.",
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: slides
              .map((slideInfo) => _Slide(
                  slideInfo.title, slideInfo.caption, slideInfo.imageUrl))
              .toList(),
        ),
        Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Skip'))),
        endReached
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Start')),
                ))
            : const SizedBox(),
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final titleTheme = textTheme.titleLarge;
    final captionTheme = textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleTheme,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionTheme,
            )
          ],
        ),
      ),
    );
  }
}
