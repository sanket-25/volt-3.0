import 'package:flutter/material.dart';
import 'package:volt/pages/connect/feed.dart';
import 'package:volt/pages/connect/challenges.dart';
import 'package:volt/pages/connect/chat.dart';
// import 'package:volt/nucleus/pages/chat/text.dart';

class Connect extends StatelessWidget {
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
            toolbarHeight: 20,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Feed'),
                Tab(text: 'Challenges'),
                Tab(text: 'Chat'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Feed(),
            Challenges(),
            Chat(),
          ],
        ),
      ),
    );
  }
}

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Feed'),
    );
  }
}

class ClubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Challenge'),
    );
  }
}

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chat'),
    );
  }
}
