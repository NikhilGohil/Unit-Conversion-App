import 'package:flutter/material.dart';

class Distance extends StatefulWidget {
  const Distance({super.key});

  @override
  State<Distance> createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {
  List<String> dropdownItems = [
    'Kilometer',
    'Centimeter',
    'Meter',
  ];

  String? outputUnit = 'Kilometer';
  String? inputUnit = 'Meter';
  final TextEditingController _controller = TextEditingController(text: '0');
  String dist = "0.0";
  final borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10));
  void abc() {
    final value = double.parse(_controller.text);
    double loc = 0.0;
    print("Input unit: $inputUnit Output unit: $outputUnit");
    switch (inputUnit) {
      case 'Kilometer':
        switch (outputUnit) {
          case 'Meter':
            loc = value * 1000;
            break;
          case 'Centimeter':
            loc = value * 100 * 1000;
            break;
          default:
            loc = value;
        }
        break;
      case 'Centimeter':
        switch (outputUnit) {
          case 'Kilometer':
            loc = value / (1000 * 100);
            break;
          case 'Meter':
            loc = value / 100;
            break;
          default:
            loc = value;
        }
        break;
      default:
        switch (outputUnit) {
          case 'Kilometer':
            loc = value / 1000;
            break;
          case 'Centimeter':
            loc = value * 100;
            break;
          default:
            loc = value;
        }
        break;
    }
    setState(() {
      dist = loc.toStringAsFixed(3);
    });
    // print(loc);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return (orientation == Orientation.portrait)
          ? buildPotrait()
          : buildLandscape();
    });
  }

  Scaffold buildPotrait() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/distance.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(color: Color.fromARGB(170, 255, 255, 255)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "DISTANCE",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.brown),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "From UNIT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          DropdownButton<String>(
                            value: inputUnit,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            underline: Container(
                              padding: const EdgeInsets.all(20),
                              height: 0,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                inputUnit = newValue;
                                dist = "0.0";
                              });
                            },
                            items: dropdownItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "To UNIT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          DropdownButton<String>(
                            value: outputUnit,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            underline: Container(
                              padding: const EdgeInsets.all(20),
                              height: 0,
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                outputUnit = newValue;
                                dist = "0.0";
                              });
                            },
                            items: dropdownItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Enter DISTANCE",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Distance',
                      enabledBorder: borders,
                      focusedBorder: borders,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      abc();
                    },
                    style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(12),
                      shadowColor: const WidgetStatePropertyAll(Colors.black),
                      backgroundColor: WidgetStateProperty.all(Colors.brown),
                      fixedSize: const WidgetStatePropertyAll(
                            Size(double.maxFinite, 50))),
                    child: const Text(
                      "CONVERT",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$outputUnit : $dist',
                    style: const TextStyle(
                        fontSize: 24, decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Scaffold buildLandscape() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/distance.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(170, 255, 255, 255)),
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "DISTANCE",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900, color: Colors.brown),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "From UNIT",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropdownButton<String>(
                                  value: inputUnit,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  underline: Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 0,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      inputUnit = newValue;
                                      dist = "0.0";
                                    });
                                  },
                                  items: dropdownItems.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Enter DISTANCE",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _controller,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Distance',
                                    enabledBorder: borders,
                                    focusedBorder: borders,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "To UNIT",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropdownButton<String>(
                                  value: outputUnit,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  underline: Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 0,
                                    color: Colors.black,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      outputUnit = newValue;
                                      dist = "0.0";
                                    });
                                  },
                                  items: dropdownItems.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: abc,
                        style: ButtonStyle(
                          elevation: WidgetStateProperty.all(12),
                          shadowColor: WidgetStateProperty.all(Colors.black),
                          backgroundColor: WidgetStateProperty.all(Colors.brown),
                          fixedSize: WidgetStateProperty.all(
                            const Size(double.maxFinite, 50),
                          ),
                        ),
                        child: const Text(
                          "CONVERT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '$outputUnit : $dist',
                        style: const TextStyle(
                          fontSize: 24,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}