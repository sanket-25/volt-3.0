import 'package:flutter/material.dart';
// import 'package:volt/nucleus/pages/chat/text.dart';
import 'events.dart';
import 'clubs.dart';
import 'posts.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
          Size.fromHeight(kToolbarHeight), // Set the height of the AppBar
          child: AppBar(
            backgroundColor: Colors.red,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Events'),
                Tab(text: 'Clubs'),
                Tab(text: 'Posts'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Events(),
            Clubs(),
            Posts(),
          ],
        ),
      ),
    );
  }
}

class ClubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Clubs Screen'),
    );
  }
}

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Posts Screen'),
    );
  }
}
