import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
// import 'package:tutionapp/apointment.dart';
import 'package:tutionapp/helpers/search.dart';
import 'package:tutionapp/pages/about.dart';
import 'package:tutionapp/pages/settings.dart';
import 'package:tutionapp/tutorItem.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ColorSchem.dart';
import 'model/model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  // Animation<double> _menuScaleAnimation;
  // Animation<Offset> _slideAnimation;
  // Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    // _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    // _menuScaleAnimation =
    //     Tween<double>(begin: 0.5, end: 1).animate(_controller);
    // _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        // .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
        backgroundColor: lightblue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading: IconButton(
          //   // onPressed: (){
          //   //   Navigator.of(context).widget(sidebar(context));
          //   // },
          //   icon: Icon(
          //     Icons.menu,
          //     color: Colors.black,
          //     size: 30,
          //   ),
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart, 
              color: Colors.black,
              size: 30),
              // onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
              onPressed: cartScreen,
            )
          ],
        ),
        drawer: menu(context),
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/searchBg.png"))),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 16, fontFamily: 'circe'),
                  ),
                  Text(
                    "User",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: (){
                            showSearch(context: context, delegate: dataSearch());
                          },
                        ),
                        // Expanded(
                        //   child: TextField(
                        //     style: TextStyle(fontSize: 18, fontFamily: 'circe'),
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         hintText: "Search for Courses or Tutors"),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated Tutors",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 13),
                  )
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[dashboard(context)]),
                ),
              ),
              // Expanded(
              //     child: SingleChildScrollView(
              //   child: Column(
              //       children: <Widget>[menu(context), dashboard(context)]),
              // )),
            ]),
          )
          )
        ]));
  }

  Widget dashboard(context) {
    final tutorsData = Provider.of<Tutors>(context);
    final tutorList = tutorsData.items;
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: tutorList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: tutorList[i],
            child: TutorItem(
            name: tutorList[i].name,
            imgUrl: tutorList[i].imgUrl,
            )));
  }

  Widget menu(context){
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              
              UserAccountsDrawerHeader(
                accountName: new Text("Tution App"),
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset("assets/images/sad.png"),
                    backgroundColor: Colors.white,
                  ),
                ),
                ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'home',
                ),
              ),
              new Column(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.settings,
                            color: Theme
                                .of(context)
                                .accentColor),
                        title: new Text("Settings"),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .push(new MaterialPageRoute(builder: (context) {
                            return new Settings();
                          }));
                        }),
                    new ListTile(
                      leading: new Icon(Icons.info,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: new Text("About"),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                              return new About();
                            }));
                      },
                    ),
                    Divider(),
                    new ListTile(
                      leading: Icon(Icons.share,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: Text("Share"),
                      onTap: () {
                        Share.share(
                            "Hey, checkout this app at https://play.google.com/store/apps/details?id=com.onedreamers.musicplayer");
                        Navigator.of(context).pop();
                      },
                    ),
                    new ListTile(
                      leading: Icon(Icons.star,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: Text("Rate the app"),
                      onTap: () {
                        Navigator.of(context).pop();

                        launchUrl(
                            "https://play.google.com/store/apps/details?id=com.onedreamers.musicplayer");
                      },
                    ),
                    new ListTile(
                      leading: Icon(Icons.payment,
                          color: Theme
                              .of(context)
                              .accentColor),
                      title: Text("Donate"),
                      onTap: () {
                        Navigator.of(context).pop();
                        launchUrl("http://paypal.me/vinchuli");
                      },
                    )
                  ],
                )
              ],),
          
          ),
        ),
    
    );
  }
  launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not open';
    }
  }

  void cartScreen() {
    Navigator.pushNamed(context, '/cart');
  }
}
