import './option_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(height: 120 ,),
            //child: Image.asset("assets/images/19197498.jpg",
             // width: size.width * 0.5,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Image.asset("assets/images/19197498.jpg",
            width: size.width * 0.5,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('ADD NEW EXPENSES or REFRESH TO TRACK',
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 24,
              color: Colors.deepPurple,
            ),)
          ),
          Container(height: 200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 10,),
              RaisedButton.icon(onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyApp()));
              },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: Icon(Icons.add , color: Colors.white,), label: Text('ADD', style: TextStyle(color: Colors.white),),

              ),
              RaisedButton.icon(onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: Icon(Icons.refresh , color: Colors.white,), label: Text('REFRESH', style: TextStyle(color: Colors.white),),
              ),
              RaisedButton.icon(onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: Icon(Icons.cloud_download , color: Colors.white,), label: Text('CLOUD', style: TextStyle(color: Colors.white),),
              ),
              Container(width: 10,),

            ],
          )
        ],
      ),

    );
  }
}
