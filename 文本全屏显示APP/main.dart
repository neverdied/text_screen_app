import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '全屏文字显示'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sliderValue=50.0;
  int groupValue0=1;
  final TextEditingController textController=new TextEditingController(text: "请输入展示文字");

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: textController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "请输入展示文字",
                    // border: InputBorder.none,     //隐藏下划线
                  ),
              ),
              Text(
                  "文字大小",
                textAlign: TextAlign.left,
              ),
              Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100.0,
                  onChanged: (value){
                setState(() {
                  sliderValue=value;
                  print(sliderValue);
                });
              },
              ),
              Row(

                children: [
                  Radio(value: 1, groupValue: groupValue0, onChanged: (index){
                    setState(() {
                      groupValue0=1;
                      print(groupValue0);
                    });
                  }),
                  Text("黑底白字"),
                  Text("      "),
                  Radio(value: 2, groupValue: groupValue0, onChanged: (index){
                    setState(() {
                      groupValue0=2;
                      print(groupValue0);
                    });
                  }),
                  Text("白底黑字")
                ],
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),

                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 20.0)),
                ),
                
                child: Text("显示字幕",
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  debugPrint(textController.text);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return TwoPageRoute(text:textController.text,fs: sliderValue,gv: groupValue0,);
                      }));
                },
              )


            ],
          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class TwoPageRoute extends StatelessWidget {
  const TwoPageRoute({Key? key,required this.text,required this.fs,required this.gv}) : super(key: key);
  final text;
  final fs;
  final gv;

  @override
  Widget build(BuildContext context) {
    Color c=Colors.white;
    Color bc=Colors.black;
    if(gv.toString()=="2"){
      c=Colors.black;
      bc=Colors.white;
    }
    return Container(
      decoration: BoxDecoration(color: bc),
      child: Center(
      child: Transform.rotate(
      angle: pi/2,
      child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: fs,
      decoration: TextDecoration.none,
      color: c,
      ),
      ),
      ),
      ),
    );
  }
}

