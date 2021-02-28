import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
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

  double _calculatePrice(int time,int piecepertime,int gram,int grampertime,int rawmaterialkg, int rawmaterialprice,int laborPricePerHour){

    double timeperpiece = time.toDouble()/piecepertime.toDouble();

    double gramperpiece = gram.toDouble()/grampertime.toDouble();

    double rawmaterialpriceofgram = rawmaterialprice.toDouble() / rawmaterialkg.toDouble() * 1000;

    double rawprice = rawmaterialpriceofgram * gramperpiece;

    double laborPrice = (3600.0 / timeperpiece) * laborPricePerHour;

    double finalPrice = rawprice + laborPrice;

    return finalPrice;
  }

  TextEditingController rawkg = new TextEditingController();
  TextEditingController rawprice = new TextEditingController();

  TextEditingController grgr = new TextEditingController();
  TextEditingController grpiece = new TextEditingController();

  TextEditingController timepiece = new TextEditingController();
  TextEditingController timetime = new TextEditingController();

  TextEditingController laborTec = new TextEditingController();

  int rawkgint,rawpriceint,grgrint,grpieceint,timepieceint,timetimeint;
  double rawpriceperkg;
  double gramperpiece;
  double timeperpiece;
  double pricewoutlabor;
  double laborprice;
  double totalPrice;
  void _incrementCounter() {
    setState(() {
      rawpriceint = int.tryParse(rawprice.text);
      rawkgint = int.tryParse(rawkg.text);
      grgrint = int.tryParse(grgr.text);
      grpieceint = int.tryParse(grpiece.text);
      timepieceint = int.tryParse(timepiece.text);
      timetimeint = int.tryParse(timetime.text);
      laborprice = double.tryParse(laborTec.text);

      rawpriceperkg = rawpriceint / rawkgint;
      gramperpiece = grgrint / grpieceint;  
      timeperpiece = timetimeint / timepieceint;
      pricewoutlabor = gramperpiece*(rawpriceperkg/1000);
      laborprice = (laborprice/3600) * timeperpiece;
      totalPrice = laborprice + pricewoutlabor;
    });
  }

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "HAMMADDE MALİYETİ HESAPLAMA",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: rawprice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Fiyat"),

                ),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: rawkg,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Kilo"),

                )
              ),
              ],
            ),

            Text(
              "GRAMAJ HESAPLAMA",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: grpiece,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Adet"),

                ),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: grgr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Gram"),

                )
              ),
              ],
            ),
            Text(
              "ZAMAN HESAPLAMA",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: timepiece,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Adet"),
                )
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: timetime,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Zaman"),
                )
              ),
              ],
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: laborTec,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "İşçilik"),
                )
              ),
              ],
            ),
            FlatButton(
              onPressed: _incrementCounter, 
              child: Text("Maliyet Hesapla"),
              color: Colors.blueAccent,
            ),
            Text('Hammaddenin kilogram fiyatı: $rawpriceperkg TL'),
            Text('Parça başı zaman: $timeperpiece saniye'),
            Text('Parça başı ağırlık: $gramperpiece gr'),
            Text('Hammadde Maliyeti: $pricewoutlabor',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Text('İşçilik Maliyeti: $laborprice',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Text('Parçanın toplam maliyeti: $totalPrice',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            
          ],
        ),
      ),
    );
  }
}
