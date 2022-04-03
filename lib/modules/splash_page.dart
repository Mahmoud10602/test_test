import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapi_01/layout/news_app/news_layout.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(

        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(('assets/images/b03_m.png'),),),),


       // decoration: BoxDecoration( color: Colors.white70),
        decoration: BoxDecoration( color: Colors.white),


        child: Lottie.asset(

         // 'assets/image/56091-people-reading-news-on-phone.json',
          'assets/image/78017-no-news-found.json',
        // 'assets/image/90942-news-icon-animation-customizable.json',

          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewsLayout()),
              ));
          },
        ),
      ),


    );
  }
}

