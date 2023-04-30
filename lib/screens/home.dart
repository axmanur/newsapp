import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/provider/news_provider.dart';
import 'package:newsapp/screens/views/detailspage.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  // const MyHomePage({super.key});

  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNews = ref.watch(newsProvider);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.white,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // backgroundColor: Colors.red,
        actions: const [
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: ClipRRect(
              // shape: ,
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   color: Colors.black12,
              // ),
              // margin: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(25.0),
              child: const FadeInImage(
                fit: BoxFit.contain,
                placeholder: NetworkImage(
                    "https://cdn.syncfusion.com/content/images/common/placeholder.gif"),
                image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2013/10/09/02/27/lake-192990__340.jpg",
                ),
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
          //get data
          //

          getNews.when(
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (data) => Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                getIndex: index,
                              ))),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  data[index].urlToImage.toString()),
                              radius: 50,
                              // margin: const EdgeInsets.all(5),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(
                              //     40,
                              //   ),
                              // ),
                              // child: Image.network(
                              //   data[index].urlToImage.toString(),
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          ),
                          // const Expanded(
                          //   flex: 1,
                          //   child: FlutterLogo(
                          //     size: 140,
                          //   ),
                          // ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // FlutterLogo(
                                //   size: 50,
                                // ),
                                Text(
                                  "${data[index].title}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.getFont(
                                    'Castoro',
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  "${data[index].author}",
                                  style: GoogleFonts.getFont('Caveat'),
                                ),
                                Text(
                                  "${data[index].content}",
                                  // "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
                                  style: GoogleFonts.getFont(
                                    'Karla',
                                    fontSize: 20,
                                  ),
                                  // maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Icon(Icons.sentiment_very_satisfied),
                                Text(
                                  data[index].publishedAt.toString(),
                                  style: GoogleFonts.getFont('Noto Serif'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            activeIcon: Icon(Icons.business_outlined),
            label: 'Business',
            // backgroundColor: Colors.green,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            // backgroundColor: Colors.purple,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            // backgroundColor: Colors.pink,
          ),
        ],
        // currentIndex: _selectedIndex,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        // onTap: (){},
        // onTap: _onItemTapped,
      ),
    );
  }
}
