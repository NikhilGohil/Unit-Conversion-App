import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  List<String> dropdownItems = [
    'deg F',
    'deg C',
    'deg K',
  ];

  String? outputUnit = 'deg C';
  String? inputUnit = 'deg F';
  final TextEditingController _controller = TextEditingController(text: '0');
  String temp = '0.0';
  final borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(10));
  void abc() {
    final data = double.parse(_controller.text);
    double loc = 0.0;
    switch (inputUnit) {
      case 'deg F':
        switch (outputUnit) {
          case 'deg C':
            loc = (data - 32) * 5 / 9;
            break;
          case 'deg K':
            loc = ((data - 32) * 5 / 9) + 273.15;
            break;
          default:
            loc = data;
        }
        break;
      case 'deg K':
        switch (outputUnit) {
          case 'deg F':
            loc = ((data - 273.15) * 9 / 5) + 32;
            break;
          case 'deg C':
            loc = data - 273.15;
            break;
          default:
            loc = data;
        }
        break;
      default:
        switch (outputUnit) {
          case 'deg F':
            loc = (data * 9 / 5) + 32;
            break;
          case 'deg K':
            loc = data + 273.15;
            break;
          default:
            loc = data;
        }
    }
    setState(() {
      temp = loc.toStringAsFixed(2);
    });
    // print("$data : $temp");
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
            image: AssetImage('assets/images/temperature.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(170, 255, 255, 255)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "TEMPERATURE",
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
                              fontSize: 15,
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
                                temp = '0';
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
                                temp = '0';
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
                    "Enter the TEMPERATURE",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Temperature',
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
                    '$outputUnit : $temp',
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
            image: AssetImage('assets/images/temperature.jpg'),
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
                        "TEMPERATURE",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
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
                                      temp = '0';
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
                                  "Enter the TEMPERATURE",
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
                                    hintText: 'Temperature',
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
                                      temp = '0.0';
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
                            Size(double.maxFinite, 50),
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
                        '$outputUnit : $temp',
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
