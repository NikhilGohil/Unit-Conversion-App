import 'package:flutter/material.dart';
import 'package:conversion_app/pages/distance.dart';
import 'package:conversion_app/pages/speed.dart';
import 'package:conversion_app/pages/temperature.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPage = '';
  Widget _currentPage = const Temperature();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "UNIT CONVERSION",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.brown,
      ),
      drawer: _drawer(),
      body: _currentPage,
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 130,
            child: const DrawerHeader(
              padding: EdgeInsets.fromLTRB(40, 5, 0, 0),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'SELECT UNIT',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.straighten),
            title: const Text('DISTANCE'),
            onTap: () {
              setState(() {
                _currentPage = const Distance();
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.thermostat),
            title: const Text('TEMPERATURE'),
            onTap: () {
              setState(() {
                _currentPage = const Temperature();
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.speed),
            title: const Text('SPEED'),
            onTap: () {
              setState(() {
                _currentPage = const Speed();
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}