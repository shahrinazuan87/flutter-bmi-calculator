import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // to remove debug banner on emulator
        title: 'Kalkulator BMI',
        theme: ThemeData.dark(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            // primarySwatch: Colors.blue,
            ),
        home: MyHomePage(title: 'Kalkulator BMI'),
        routes: <String, WidgetBuilder>{
          '/page2': (BuildContext context) => new Page2(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //declare variable jisim. tinggi
  final TextEditingController jisim = TextEditingController();
  final TextEditingController tinggi = TextEditingController();

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.dehaze),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).pushNamed('/page2');
            },
          )
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true, // to override app title to center
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: (AssetImage('assets/logo.png')),
          ),
          // Padding(
          //   // padding: EdgeInsets.all(16.0),
          //   child: Image(
          //     width: 180,
          //     image: (AssetImage('assets/logo.png')),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              autocorrect: true,
              controller: jisim,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan berat peserta (kg)'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              autocorrect: true,
              controller: tinggi,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan tinggi peserta (m)'),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              autofocus: true,
              onPressed: () {
                //calculator bmi

                //capture data variable
                double dataJisim = double.parse(jisim.text);
                double dataTinggi = double.parse(tinggi.text);

                //formula
                double bmi = dataJisim / (dataTinggi * dataTinggi);
                Toast.show(
                    'Data BMI peserta ialah ' + bmi.toStringAsFixed(3), context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                // String category, message;

                // //formula BMI=kg/(m*m)
                // double BMI=kg/(meter*meter);
                // if(BMI<= 18.8){
                //   message="You are UNDERWEIGHT";
                //   Fluttertoast.showToast(
                //     msg: message,
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.CENTER,
                //     backgroundColor: Colors.green,
                //     textColor: Colors.white,
                //     fontSize: 16.0
                //   );
                // }
                // else if(BMI>=18.8 && BMI<25){
                //   message="Your BMI is  NORMAL";
                //   Fluttertoast.showToast(
                //     msg: message,
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.CENTER,
                //     backgroundColor: Colors.blue,
                //     textColor: Colors.white,
                //     fontSize: 16.0
                //   );
                // }
                // else if(BMI>=25 && BMI<30){
                //   message="Your BMI is  OVERWEIGHT";
                //   Fluttertoast.showToast(
                //     msg: message,
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.CENTER,
                //     backgroundColor: Colors.orange,
                //     textColor: Colors.white,
                //     fontSize: 16.0
                //   );
                // }
                // else if(BMI>=30){
                //   message="Your BMI is categorised as OBESITY";
                //   Fluttertoast.showToast(
                //     msg: message,
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.CENTER,
                //     backgroundColor: Colors.red,
                //     textColor: Colors.white,
                //     fontSize: 16.0
                //   );
                // }//else if
              },
              child: Text('KIRA BMI PESERTA'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //calculator bmi

      //     //capture data variable
      //     double dataJisim = double.parse(jisim.text);
      //     double dataTinggi = double.parse(tinggi.text);

      //     //formula
      //     double bmi = dataJisim / (dataTinggi * dataTinggi);
      //     Toast.show(
      //         'Data BMI peserta ialah ' + bmi.toStringAsFixed(3), context,
      //         duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.calculate),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
