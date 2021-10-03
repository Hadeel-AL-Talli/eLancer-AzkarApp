import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  String _message = 'عن التطبيق ';
  @override
  Widget build(BuildContext context) {
    // ModalRoute? modalRoute = ModalRoute.of(context);
    // if (modalRoute != null) {
    //   Map<String, dynamic> arguments =
    //       modalRoute.settings.arguments as Map<String, dynamic>;
    //   if (arguments.containsKey('message')) {
    //     _message = arguments['message'];
    //   }
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          _message,
          style: const TextStyle(
              fontFamily: 'Noto', color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration:const BoxDecoration(
             
                image: DecorationImage(image: AssetImage('images/img.jpg'))),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                  ' يساعدك تطبيق سبحة الأذكارعلى المحافظة على ذكر الله من خلال عداد التسبيح ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noto',
                      fontSize: 16,
                      color: Colors.teal)),
            ),
          ),
        ],
      ),
    );
  }
}
