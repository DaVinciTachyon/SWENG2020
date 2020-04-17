import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:EiSHT/goals/detailsPage.dart';
import 'package:EiSHT/goals/ANewGoal.dart';

class GoalSetting extends StatefulWidget {
  @override
  _GoalSettingState createState() => _GoalSettingState();
}

class _GoalSettingState extends State<GoalSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Theme.of(context).buttonColor,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Theme.of(context).buttonColor
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Goal',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Setting',
                    style: TextStyle(color: Theme.of(context).buttonColor, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: ListView(children: [
                        _buildGoalItem(
                            0, 'images/003-medal.png', 'Personal Goals', '4'),
                        _buildGoalItem(1, 'images/022-earn-money.png',
                            'Professional Goals', '4'),
                        _buildGoalItem(
                            2, 'images/008-vision.png', 'Self Awareness', '4'),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalItem(int id, String imgPath, String goalName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () async {
          //  ANewGoal makeGoal =await     CHECK
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(id: id, heroTag: imgPath, goalName: goalName)),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Hero(
                    tag: imgPath,
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        goalName,
                        style: TextStyle(
                          fontFamily: 'Monserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
