import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5, 100.0),
                            bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width * 0.5, 100.0),
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Icon(
                              Icons.close,
                              color: Color(0xffC3C3C3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Sanket Dhuri',
                                style: TextStyle(
                                  color: Color(0xffBDBDBD),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffD8D8D8),
                            child: Icon(
                              Icons.chat,
                              size: 30,
                              color: Color(0xff6E6E6E),
                            ),
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                                'data:image/jpeg;base64,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'),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffD8D8D8),
                            child: Icon(
                              Icons.call,
                              size: 30,
                              color: Color(0xff6E6E6E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Exploring the Race within me. Pushing My Limits. ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ATHLETE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'STATE LEVEL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '100 METERS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '400 METERS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                color: Color(0xffF8F8F8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Article'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Followers'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '200',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Text('Following'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
