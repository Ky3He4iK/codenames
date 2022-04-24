import 'package:flutter/material.dart';
import 'widget/card.dart';
import 'style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codenames',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CardWidget(child: Text("789789")),
                    Expanded(
                        flex: 4,
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                CardWidget(child: Text("asdasd"), color: ColorConstants.blue,),
                                CardWidget(child: Text("asdasd"), color: ColorConstants.red,),
                                CardWidget(child: Text("asdasd"), color: ColorConstants.green,),
                                CardWidget(child: Text("asdasd"), color: ColorConstants.yellow,),
                              ],
                            )),
                  ],
                )),
            CardWidget(child: Text("asdasd"), color: ColorConstants.black,),
          ],
        ));
  }
}
