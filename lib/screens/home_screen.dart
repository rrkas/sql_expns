import 'package:flutter/material.dart';

import './option_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(height: 120),
            //child: Image.asset("assets/images/19197498.jpg",
            // width: size.width * 0.5,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/19197498.jpg",
              width: size.width * 0.5,
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
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyApp()));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('ADD', style: TextStyle(color: Colors.white)),
              ),
              RaisedButton.icon(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text('REFRESH', style: TextStyle(color: Colors.white)),
              ),
              RaisedButton.icon(
                onPressed: () {},
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
