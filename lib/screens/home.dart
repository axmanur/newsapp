import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.white,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 30,
            ),
            child: Icon(
              Icons.notification_add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Card(
            // shape: ,
            // width: double.infinity,
            // decoration: const BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            //   color: Colors.black12,
            // ),
            margin: EdgeInsets.all(8),
            child: FadeInImage(
              fit: BoxFit.contain,
              placeholder: NetworkImage(
                  "https://cdn.syncfusion.com/content/images/common/placeholder.gif"),
              image: NetworkImage(
                "https://cdn.pixabay.com/photo/2013/10/09/02/27/lake-192990__340.jpg",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recomanded for you",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times",
                  ),
                ),
                Text("Show More"),
              ],
            ),
          ),

          //
          Expanded(
            child: ListView.builder(
              itemCount: 18,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(8),
                color: Colors.grey[350],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: const FlutterLogo(
                          size: 140,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // FlutterLogo(
                            //   size: 50,
                            // ),
                            const Text(
                                "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                            const SizedBox(
                              height: 20,
                            ),
                            // Icon(Icons.sentiment_very_satisfied),
                            Text(DateTime.now().toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: Container(
      //   color: Colors.black26,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
