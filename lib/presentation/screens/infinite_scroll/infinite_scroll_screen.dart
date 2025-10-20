import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List imagesIds = [1, 2, 3, 4, 5];
  ScrollController scrollViewController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollViewController.addListener(() {
      if ((scrollViewController.position.pixels + 500) >=
          scrollViewController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollViewController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    final lastImage = imagesIds.last;

    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastImage + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollViewController.position.pixels + 150) <=
        scrollViewController.position.maxScrollExtent)
      return;

    scrollViewController.animateTo(
      scrollViewController.position.pixels + 120,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
  }

  void addFiveImages() {
    final lastImage = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastImage + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 15,
          child: ListView.builder(
            controller: scrollViewController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : context.pop,
        child: isLoading
            ? SpinPerfect(infinite: true, child: Icon(Icons.refresh_rounded))
            : Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
