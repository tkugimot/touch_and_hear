import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Sound.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ぴよぴよサウンドパーク',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ぴよぴよサウンドパーク'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Sound sound = Sound();

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: [
          IconButton(
              icon: Image.asset('assets/images/dog.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.DogButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/cat.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.CatButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/elephant.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.ElephantButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/leo.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.LeoButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/horse.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.HorseButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/piyo.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.PiyoButton);
              }),
        ]),
    GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: [
          IconButton(
              icon: Image.asset('assets/images/bicycle.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.BicycleButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/bike.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.BikeButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/fune.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.FuneButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/kyukyusya.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.KyuKyuSyaButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/patocar.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.PatocarButton);
              }),
          IconButton(
              icon: Image.asset('assets/images/super_car.png'),
              iconSize: 50,
              onPressed: () {
                sound.play(SoundIds.SuperCarButton);
              }),
        ]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'どうぶつ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'のりもの',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
