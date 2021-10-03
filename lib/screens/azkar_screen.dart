import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  int _counter = 0;
  String _content = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actionsIconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about_screen',
                      arguments: {'message', 'تطبيق مسبحة الاذكار'});
                },
                icon: const Icon(Icons.info_outline)),
            PopupMenuButton<String>(onSelected: (value) {
              if (_content != value) {
                setState(() {
                  _content = value;
                  _counter = 0;
                });
              }
            }, itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('الحمد لله'),
                  value: 'الحمد لله',
                ),
                const PopupMenuItem(
                  child: Text('استغفر الله'),
                  value: 'استغفر الله',
                ),
                const PopupMenuItem(
                  child: Text('سبحان الله'),
                  value: 'سبحان الله',
                ),
              ];
            }),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text('سبحة الأذكار',
              style: TextStyle(
                  fontFamily: 'Noto', fontSize: 18, color: Colors.black)),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://image.freepik.com/free-vector/mandala-illustration_53876-81805.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDVavkfDVDuJMYrz5myNAeRKsbuy0AM8Av_A&usqp=CAU')),
            Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 0),
                        blurRadius: 6)
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Noto')),
                  ),
                  DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                      ),
                      child: SizedBox(
                          width: 50,
                          height: double.infinity,
                          child: Center(
                              child: Text(
                            _counter.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Noto',
                                fontSize: 20),
                          )))),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ++_counter;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal.shade500,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(10.0),
                            ),
                          )),
                      child: const Text('تسبيح',
                          style: TextStyle(
                            fontFamily: 'Noto',
                          )),
                    )),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange.shade800,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10.0),
                        ),
                      )),
                  child: const Text('إعادة',
                      style: TextStyle(
                        fontFamily: 'Noto',
                      )),
                ))
              ],
            )
          ]),
        ));
  }
}
