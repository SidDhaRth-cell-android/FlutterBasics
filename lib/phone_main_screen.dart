import 'package:flutter/material.dart';

class PhoneMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PhoneAppBar(),
        backgroundColor: Colors.white.withOpacity(0.95),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.dialpad_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        bottomNavigationBar: BottomNavigationBar(
            useLegacyColorScheme: false,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: "Favourites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.watch_later_outlined), label: "Recent"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Contacts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.voicemail), label: "Voicemail")
            ]),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone,
                size: 100,
                color: Colors.grey.shade400,
              ),
              Text("No one is on your speed dial yet"),
              TextButton(onPressed: () {}, child: Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: double.infinity,
      color: Colors.blue,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Icon(Icons.search),
            Text("Search"),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
