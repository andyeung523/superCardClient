import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:super_card_client/constants.dart';

class ExplorePage extends StatefulWidget {
  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  // Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageList = [
      Image.asset('assets/images/dimdimgreen.png'),
      Image.asset('assets/images/luluapple.png'),
      Image.asset('assets/images/maxgym.png')
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Exlore offers around you"),
        backgroundColor: Constants.kPrimaryColor,
        elevation: 0.0,
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(FontAwesomeIcons.search),
        //       onPressed: () {
        //         //
        //       }),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset('assets/images/map.png'),
              Container(
                color: Colors.green,
                height: 8,
              ),
              SizedBox(
                height: 10,
              ),
              GFCarousel(
                // height: 500,
                items: imageList,
                enableInfiniteScroll: false,
                onPageChanged: (index) {
                  setState(() {
                    index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
