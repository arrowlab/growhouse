import 'package:flutter/material.dart';
import 'package:growhouse_dashboard/custom_data.dart';
import 'package:growhouse_dashboard/database.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double? redValue;
  double? greenValue;
  double? blueValue;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    CustomData data = Provider.of<CustomData>(context);
    if (data.redValue == null ||
        data.greenValue == null ||
        data.blueValue == null) {
      return Container();
    } else {
      if (redValue == null && greenValue == null && blueValue == null) {
        redValue = data.redValue!;
        greenValue = data.greenValue!;
        blueValue = data.blueValue!;
      }

      return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataWindow(
                    title: "Soil pH",
                    value: data.pH.toString(),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DataWindow(
                    title: "Humidity",
                    value: data.humidity.toString(),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DataWindow(
                    title: "Temperature",
                    value: data.temperature.toString(),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataWindow(
                    title: "Red Intensity",
                    value: data.redIntensity.toString(),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DataWindow(
                    title: "Green Intensity",
                    value: data.greenIntensity.toString(),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DataWindow(
                    title: "Blue Intensity",
                    value: data.blueIntensity.toString(),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataWindow(
                    title: "Red Concentration",
                    value: data.redConcentration.toString(),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DataWindow(
                    title: "Green Concentration",
                    value: data.greenConcentration.toString(),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DataWindow(
                    title: "Blue Concentration",
                    value: data.blueConcentration.toString(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 1000,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 50, child: Text("Red")),
                          Container(
                            width: 800,
                            child: Slider(
                              value: redValue!,
                              max: 132000,
                              divisions: 132,
                              label: "value",
                              onChanged: (double value) {
                                setState(() {
                                  redValue = value;
                                });
                              },
                            ),
                          ),
                          Container(
                              width: 50, child: Text(redValue!.toString())),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 50, child: Text("Green")),
                          Container(
                            width: 800,
                            child: Slider(
                              value: greenValue!,
                              max: 132000,
                              divisions: 132,
                              label: "value",
                              onChanged: (double value) {
                                setState(() {
                                  greenValue = value;
                                });
                              },
                            ),
                          ),
                          Container(
                              width: 50, child: Text(greenValue!.toString())),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 50, child: Text("Blue")),
                          Container(
                            width: 800,
                            child: Slider(
                              value: blueValue!,
                              max: 132000,
                              divisions: 132,
                              label: "value",
                              onChanged: (double value) {
                                setState(() {
                                  blueValue = value;
                                });
                              },
                            ),
                          ),
                          Container(
                              width: 50, child: Text(blueValue!.toString())),
                        ],
                      ),
                      TextButton(
                          onPressed: () async {
                            await Database().toFirestore(CustomData(
                              pH: 0,
                              humidity: 0,
                              temperature: 0,
                              redValue: redValue,
                              greenValue: greenValue,
                              blueValue: blueValue,
                            ));
                          },
                          child: Text("Update"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

class DataWindow extends StatelessWidget {
  String? title;
  String? value;

  DataWindow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title!, style: TextStyle(fontSize: 20,),),
          Text(value!, style: TextStyle(fontSize: 15,),),
        ],
      ),
    );
  }
}
