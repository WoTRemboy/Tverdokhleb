import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: VideoTime()
));

class VideoTime extends StatefulWidget {
  VideoTime() : super();

  @override
  VideoTimeState createState() => VideoTimeState();
}

class VideoTimeState extends State<VideoTime> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201307/4eb4c5c1-70b2-450d-aa78-4f659dff978d.mp4";

  void postData() async{
    try {
    final response = await url;
  } catch (err) {}
}

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Когда твой функционал с первого раза прошел QA без багов",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () => {},
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                          transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime2();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      );
  }
}



// ////////////////////////////////   2    //////////////////////////////////////




class VideoTime2 extends StatefulWidget {
  VideoTime2() : super();

  @override
  VideoTimeState2 createState() => VideoTimeState2();
}

class VideoTimeState2 extends State<VideoTime2> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201407/b08a60b4-985c-4ed8-83bd-e7904ecd2178.mp4";

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Когда на презентации выплывает твой баг и все смотрят на тебя",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime3();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}


// ////////////////////////////////   3    //////////////////////////////////////


class VideoTime3 extends StatefulWidget {
  VideoTime3() : super();

  @override
  VideoTimeState3 createState() => VideoTimeState3();
}

class VideoTimeState3 extends State<VideoTime3> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201408/cccb6636-5332-487e-b4c1-3563bc05347c.mp4";

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Prototype ver 0.0.4",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime4();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}




// ////////////////////////////////   4    //////////////////////////////////////


class VideoTime4 extends StatefulWidget {
  VideoTime4() : super();

  @override
  VideoTimeState4 createState() => VideoTimeState4();
}

class VideoTimeState4 extends State<VideoTime4> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201606/ec3979bd-939e-4e4a-b10b-9cc69003b4bf.mp4";

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Когда презентация спасла серьезный проект, который слепили так как смогли!",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime5();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}





// ////////////////////////////////   5    //////////////////////////////////////


class VideoTime5 extends StatefulWidget {
  VideoTime5() : super();

  @override
  VideoTimeState5 createState() => VideoTimeState5();
}

class VideoTimeState5 extends State<VideoTime5> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201312/fd678654-5257-42a0-afda-428f49662a7e.mp4";

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Презентация стартапа",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime6();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}


// ////////////////////////////////   6    //////////////////////////////////////


class VideoTime6 extends StatefulWidget {
  VideoTime6() : super();

  @override
  VideoTimeState6 createState() => VideoTimeState6();
}

class VideoTimeState6 extends State<VideoTime6> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201408/ab275d2d-084a-4dd4-b4f2-eb42e0b23f9f.mp4";

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Дали стажера. День первый.",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime7();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}


// ////////////////////////////////   7    //////////////////////////////////////


class VideoTime7 extends StatefulWidget {
  VideoTime7() : super();

  @override
  VideoTimeState7 createState() => VideoTimeState7();
}

class VideoTimeState7 extends State<VideoTime7> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final url = "https://static.devli.ru/public/images/v/201307/4eb4c5c1-70b2-450d-aa78-4f659dff978d.mp4";

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Developers Life'),
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.account_circle_rounded,
                color: Colors.grey[400],
                size: 35),
          ),
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 480,
                    child: FutureBuilder(future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                        }

                    ),
                  ),
                  Container(
                    width: 390,
                    height: 45,
                    margin: EdgeInsets.only(left: 10, top: 445, right: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: Text("Когда твой функционал с первого раза прошел QA без багов",
                        style: TextStyle(color: Colors.white)),
                    margin: EdgeInsets.only(left: 25, top: 450, right: 25),
                  ),
                ],
              ),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.replay_rounded,
                            size: 35,
                            color: Colors.orange),
                        backgroundColor: Colors.white,
                        hoverColor: Colors.orange,
                        splashColor: Colors.white),


                    Padding(padding: EdgeInsets.only(left: 20)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            transitionDuration:  const Duration(milliseconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return VideoTime2();
                            }));
                      },
                      child: Icon(Icons.arrow_forward_rounded,
                        size: 35,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      hoverColor: Colors.green,
                      splashColor: Colors.white,
                    ),

                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}