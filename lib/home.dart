import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    try {
      data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch (e) {
      data = data;
    }
    print(data);

    // set background

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night2.jpg';
    Color bgColor = data['isDaytime'] ? Colors.yellowAccent : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(


          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(

                children: <Widget>[
                  TextButton(onPressed: ()  async{

                   dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDaytime' : result['isDaytime'],
                      'flag' : result['flag']
                    };
                  });
                   },

                      style: TextButton.styleFrom(
                        primary: Colors.black
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(

                              Icons.edit_location,
                            color: Colors.grey[300],
                          ),
                          Text(
                              'Edit Location',
                            style: TextStyle(
                              color: Colors.grey[300],
                            ),
                          )
                        ],
                      )



                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),),
                ],
              ),
            ),
          )),
    );
  }
}
