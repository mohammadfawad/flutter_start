import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({super.key});
  int index = 0;

  List<String> buttonText = ["Click The Button", "You Clicked the Button"];

  void setButtonText() {
    setState(() {
      index = index + 1;
      print('index = $index');
    });
  }

  String getButtonText(int arrayIndex) {
    if (index > 1) {
      index = 0;
    }
    return buttonText[index];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Application", style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            backgroundColor: Colors.deepOrangeAccent,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blueTextWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonClickTextChange(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: setButtonText,
                        child: Text('Click Me, index = $index')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.add), color: Colors.deepOrange),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonClickTextChange(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => setState(() {
                              index = index + 1;
                              print('index = $index');
                            }),
                        child: Text('Click Me, index = $index')),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Card buttonClickTextChange() {
    return Card(
      child: Text(getButtonText(index), style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      color: Colors.deepOrangeAccent,

    );

  }
}

class blueTextWidget extends StatelessWidget {
  const blueTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("This is widget Text Element", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green), textAlign: TextAlign.justify,);
  }
}
