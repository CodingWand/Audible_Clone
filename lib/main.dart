import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audible Clone',
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
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark,

        textTheme: const TextTheme(
          headline2: TextStyle(color: Colors.white, fontSize: 25),
          headline3: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Audible'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: const [
          Padding(
            child: Icon(Icons.search, color: Colors.white),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                "lake.jpg",
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Text(
                  'Il vous reste 3 crédits audios.',
                  style: Theme.of(context).textTheme.headline3,
                  softWrap: true,
                ),
              ),
            ],
          ),
          const HorizontalBookCollection(
            collectionName: "Vos derniers titres",
            books: 15,
          ),
          const HorizontalBookCollection(
            collectionName: 'Recommandations selon votre bibliothèque',
            books: 15,
          ),
          const HorizontalBookCollection(
            collectionName: 'Top ventes',
            books: 15,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bibliothèque',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Parcourir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.orangeAccent,
      ),
    );
  }
}

class HorizontalBookCollection extends StatefulWidget {
  final String collectionName;
  final int books;

  const HorizontalBookCollection(
      {Key? key, required this.collectionName, required this.books})
      : super(key: key);

  @override
  State<HorizontalBookCollection> createState() => _HorizontalBookCollectionState();
}

class _HorizontalBookCollectionState extends State<HorizontalBookCollection> {
  final ScrollController _myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.collectionName,
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(top: 10),
          child: Scrollbar(
            controller: _myScrollController,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              controller: _myScrollController,
              itemCount: widget.books,
              itemBuilder: (_, index) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://m.media-amazon.com/images/I/61y9Jijcz9L._SL500_.jpg",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        "Harry Potter à l'école des sorciers",
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Par J.K. Rowling",
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
