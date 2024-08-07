import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/home_page_bar.dart';
import 'package:netflix_clone/widgets/home_slide_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();
  bool isMovie = true;
  bool isTvShow = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.offset < 600) {
      setState(() {
        isMovie = true;
        isTvShow = false;
      });
    } else if (controller.offset > 600) {
      setState(() {
        isMovie = false;
        isTvShow = true;
      });
    }
  }

  void _updateFilter(bool movieSelected) async {
    setState(() {
      isMovie = movieSelected;
      isTvShow = !movieSelected;
    });
    controller.removeListener(_scrollListener);
    await controller.animateTo(
      isTvShow ? 600 : 0,
      duration: const Duration(milliseconds: 300), // Duration of the animation
      curve: Curves.easeInOut, // Curve of the animation
    );
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: HomePageBar(
            minExtent: 110,
            maxExtent: 110,
            isMovie: isMovie,
            isTvShow: isTvShow,
            onFilterChanged: _updateFilter,
          ),
        ),
        const SliverToBoxAdapter(
          child: SlideWidget(),
        ),
      ],
    );
  }

  bool get wantKeepAlive => true;
}
