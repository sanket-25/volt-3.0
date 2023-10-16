import 'package:flutter/material.dart';
import 'map.dart';

class Clubs extends StatelessWidget {

  final List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(
            body: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Center(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 170,
                                  // color: Colors.orange,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black, spreadRadius: 3),
                                    ],
                                  ),

                                  child: Text(
                                    'Data 1',
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 170,
                                  // color: Colors.purple,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black, spreadRadius: 3),
                                    ],
                                  ),
                                  child: Text(
                                    'Data 2',
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 170,
                                  // color: Colors.teal,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black, spreadRadius: 3),
                                    ],
                                  ),
                                  child: Text(
                                    'Data 3',
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                  ),
                  Positioned(bottom: 20, right: 10,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigate to SecondPage when the button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Map()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20)

                          ),
                        )
                    ),
                  ),
                ]
            )

        )
    );
  }
}
