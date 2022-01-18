import 'package:flutter/material.dart';
import 'package:signup/newScreens/home_page.dart';
import 'package:super_easy_permissions/super_easy_permissions.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PermissionPageState();
}

enum GrantStatus { NOT_CHECKED, NOT_GRANTED, GRANTED }

class PermissionPageState extends State<PermissionPage> {
  RaisedButton permButton;
  Text permStatusText;
  Color statusColor = Colors.white;
  GrantStatus _grantStatus = GrantStatus.NOT_CHECKED;

  @override
  void initState() {
    super.initState();

    RaisedButton requestButton = RaisedButton(
      child: const Text("Allow"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      textColor: Colors.white,
      color: Colors.redAccent,
      onPressed: () {
        requestPermission();
      },
    );

    Text requestText = const Text("Please Allow SMS Permission", style: TextStyle(fontSize: 18));

    Future<bool> permStatus = getPermissionStatus();
    permStatus.then((res) {
      setState(() {
        if (res) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), ModalRoute.withName("/Home"));
        } else {
          _grantStatus = GrantStatus.NOT_GRANTED;
          permButton = requestButton;
          permStatusText = requestText;
          statusColor = Colors.orange;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("hell in build");

    RaisedButton nextButton = RaisedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), ModalRoute.withName("/Home"));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const Text("Next"),
      textColor: Colors.white,
      color: Colors.blue,
    );

    Text nextScreenText = const Text(
      "Awesome! Now continue",
      style: TextStyle(fontSize: 18),
    );

    if (_grantStatus == GrantStatus.NOT_CHECKED) {
      permButton = RaisedButton(
        onPressed: () {},
        color: Colors.white,
        elevation: 0,
      );
      permStatusText = const Text("");
    } else if (_grantStatus == GrantStatus.GRANTED) {
      permButton = nextButton;
      permStatusText = nextScreenText;
      statusColor = Colors.blue;
    }

    AssetImage image = const AssetImage('assets/images/img.png');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: image)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  permStatusText,
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: permButton,
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: statusColor, width: 2, style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> getPermissionStatus() async {
    return SuperEasyPermissions.askPermission(Permissions.sms);
    // return SuperEasyPermissions.askPermission(Permissions.sms);
  }

  requestPermission() async {
    bool res = (await SuperEasyPermissions.getPermissionResult(Permissions.sms)) as bool;
    //await SuperEasyPermissions.requestPermission(Permission.ReadSms);
    if (res) {
      setState(() {
        debugPrint("hell in stting state");
        _grantStatus = GrantStatus.GRANTED;
      });
    }
  }
}
