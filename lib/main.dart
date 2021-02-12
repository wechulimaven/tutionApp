import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutionapp/ColorSchem.dart';
import 'package:tutionapp/apointment.dart';
import 'package:tutionapp/eventcalendar.dart';
// import 'package:tutionapp/home.dart';
import 'package:tutionapp/homePage.dart';
import 'package:tutionapp/model/apointcartmodel.dart';
import 'package:tutionapp/model/apointmentsmodel.dart';
import 'package:tutionapp/model/model.dart';
import 'package:tutionapp/teacherdetail.dart';
// import 'package:tutionapp/teacherpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Tutors()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        '/HomePage' :(context)=>Home(),
        '/teachersPage' :(context)=>DetailPage(),
        '/cart': (context)=>CartScreen(),
        '/calendar': (context)=>CalendarHome()
        // DetailPage.routeName: (context)=>DetailPage(),
      },
      )
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gokids.COM", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'circe'
                  ),),
                  Text("Skip", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'circe'
                  ),)
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.contain
                )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("WHERE KIDS LOVE LEARNING",style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'circe'
                  ),),
                  Text("Distant Learning & Home \nSchooling Made Easy",style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'circe'
                  ),textAlign: TextAlign.center,),
                  Text("Book Filtered Top Rated Professional \nTutors from the comfort \nOf your home in just a few clicks",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'circe'
                  ),textAlign: TextAlign.center,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 15,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkblue,
                        ),
                        child: IconButton(
                          onPressed: openHomePage,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void openHomePage()
  {
    Navigator.pushNamed(context, '/HomePage');
  }
}
