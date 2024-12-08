import 'package:flutter/material.dart';

class LockedProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("You locked your profile", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),),
              SizedBox(
                height: 8,
              ),
              Text("Your photos and posts are more private", style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.message),
                        backgroundColor: Colors.black12,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Invite Friends", style: TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.unfold_less_outlined),
                        backgroundColor: Colors.black12,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Unlock", style: TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.question_mark),
                        backgroundColor: Colors.black12,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Learn more", style: TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                        "Only friends can see the photos, posts and stories of this account"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.perm_camera_mic),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                        "Only friends can see the full-size profile picture of this account"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                        "People can still search for you and send you friend requests"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
