import 'package:signup/customs/expense_chart.dart';
import 'package:signup/ex_pages/home_page.dart';
import 'package:signup/expensetracker/etracker.dart';
import 'package:signup/refresh.dart';
import 'package:signup/widgets/list.dart';

import '../../Screens/option_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 10),
          //   child: SizedBox(height: 120),
          //   //child: Image.asset("assets/images/img.png",
          //   // width: size.width * 0.5,),
          // ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/img.png",
              width: size.width * 0.7,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'ADD NEW EXPENSES or REFRESH TO TRACK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 24,
                  color: Colors.deepPurple,
                ),
              )),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyAppp()));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('ADD', style: TextStyle(color: Colors.white)),
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListPage()));
                  //Navigator.of(context).push(MaterialPageRoute(builder: (_) => PieChartPage()));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text('REFRESH', style: TextStyle(color: Colors.white)),
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => Refresh()));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: const Icon(Icons.cloud_download, color: Colors.white),
                label: const Text('CLOUD', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}