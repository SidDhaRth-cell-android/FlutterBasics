import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InstaPage extends StatefulWidget {
  const InstaPage({super.key});

  @override
  State<InstaPage> createState() => _InstaPageState();
}

class _InstaPageState extends State<InstaPage> {
  bool _isScrolling = false;
  List<Widget> instaPages = [];

  int _index = 0;

  @override
  void initState() {
    final homePage = Home(onScrollStarted: (isScrolling) {
      _isScrolling = isScrolling;
      setState(() {});
    });
    instaPages.add(homePage);
    instaPages.add(Search());
    instaPages.add(Reels());
    instaPages.add(Shop());
    instaPages.add(Profile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: instaPages[_index],
      bottomNavigationBar: Opacity(
        opacity: 0.1  ,
        child: BottomNavigationBar(
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            useLegacyColorScheme: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            onTap: (index) => setState(() => _index = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  tooltip: "Home",
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_call), label: "Reels"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: "Shop"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: "Profile"),
            ]),
      ),
    );
  }
}

class Home extends StatefulWidget {
  final Function(bool) onScrollStarted;

  const Home({super.key, required this.onScrollStarted});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      _controller.addListener(() {
        widget.onScrollStarted.call(true);
        print("User started scrolling");
      });

      _controller.position.isScrollingNotifier.addListener(() {
        if (!_controller.position.isScrollingNotifier.value) {
          widget.onScrollStarted.call(false);
          print('scroll is stopped');
        } else {
          print('scroll is started');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}

class Reels extends StatelessWidget {
  const Reels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Reels"),
      ),
    );
  }
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Shop"),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
