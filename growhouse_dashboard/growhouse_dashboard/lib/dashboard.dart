import 'package:flutter/material.dart';
import 'package:growhouse_dashboard/custom_data.dart';
import 'package:growhouse_dashboard/database.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
                  SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 14,
                        interval: 1,
                        radiusFactor: 0.4,
                        showAxisLine: false,
                        showLastLabel: false,
                        minorTicksPerInterval: 4,
                        majorTickStyle: MajorTickStyle(
                            length: 8, thickness: 3, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 1.5, color: Colors.grey),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        onLabelCreated: labelCreated),
                    RadialAxis(
                        minimum: 0,
                        maximum: 14,
                        labelOffset: 30,
                        axisLineStyle: AxisLineStyle(
                            thicknessUnit: GaugeSizeUnit.factor,
                            thickness: 0.03),
                        majorTickStyle: MajorTickStyle(
                            length: 6, thickness: 4, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 3, color: Colors.white),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0,
                              endValue: 14,
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.03,
                              endWidth: 0.03,
                              gradient: SweepGradient(colors: const <Color>[
                                Colors.yellow,
                                Colors.green,
                                Colors.red
                              ], stops: const <double>[
                                0.0,
                                0.5,
                                1
                              ]))
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                              value: data.pH,
                              needleLength: 0.95,
                              enableAnimation: true,
                              animationType: AnimationType.ease,
                              needleStartWidth: 1.5,
                              needleEndWidth: 6,
                              needleColor: Colors.red,
                              knobStyle: KnobStyle(
                                  knobRadius: 0.09,
                                  sizeUnit: GaugeSizeUnit.factor))
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Column(children: <Widget>[
                                Text(data.pH.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 100),
                                Text('pH',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))
                              ])),
                              angle: 90,
                              positionFactor: 0.75)
                        ])
                  ]),
                  SizedBox(
                    width: 50,
                  ),
                  SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 1,
                        interval: 0.1,
                        radiusFactor: 0.4,
                        showAxisLine: false,
                        showLastLabel: false,
                        minorTicksPerInterval: 4,
                        majorTickStyle: MajorTickStyle(
                            length: 8, thickness: 3, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 1.5, color: Colors.grey),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        onLabelCreated: labelCreated),
                    RadialAxis(
                        minimum: 0,
                        maximum: 1,
                        labelOffset: 30,
                        axisLineStyle: AxisLineStyle(
                            thicknessUnit: GaugeSizeUnit.factor,
                            thickness: 0.03),
                        majorTickStyle: MajorTickStyle(
                            length: 6, thickness: 4, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 3, color: Colors.white),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0,
                              endValue: 200,
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.03,
                              endWidth: 0.03,
                              gradient: SweepGradient(colors: const <Color>[
                                Colors.red,
                                Colors.yellow,
                                Colors.green,
                              ], stops: const <double>[
                                0.0,
                                0.5,
                                1
                              ]))
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                              value: data.humidity,
                              needleLength: 0.95,
                              enableAnimation: true,
                              animationType: AnimationType.ease,
                              needleStartWidth: 1.5,
                              needleEndWidth: 6,
                              needleColor: Colors.red,
                              knobStyle: KnobStyle(
                                  knobRadius: 0.09,
                                  sizeUnit: GaugeSizeUnit.factor))
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Column(children: <Widget>[
                                Text(data.humidity.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 100),
                                Text('%',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))
                              ])),
                              angle: 90,
                              positionFactor: 0.75)
                        ])
                  ]),
                  SizedBox(
                    width: 50,
                  ),
                  SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        startAngle: 270,
                        endAngle: 270,
                        minimum: 0,
                        maximum: 40,
                        interval: 10,
                        radiusFactor: 0.4,
                        showAxisLine: false,
                        showLastLabel: false,
                        minorTicksPerInterval: 4,
                        majorTickStyle: MajorTickStyle(
                            length: 8, thickness: 3, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 1.5, color: Colors.grey),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        onLabelCreated: labelCreated),
                    RadialAxis(
                        minimum: 0,
                        maximum: 40,
                        labelOffset: 30,
                        axisLineStyle: AxisLineStyle(
                            thicknessUnit: GaugeSizeUnit.factor,
                            thickness: 0.03),
                        majorTickStyle: MajorTickStyle(
                            length: 6, thickness: 4, color: Colors.white),
                        minorTickStyle: MinorTickStyle(
                            length: 3, thickness: 3, color: Colors.white),
                        axisLabelStyle: GaugeTextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0,
                              endValue: 200,
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.03,
                              endWidth: 0.03,
                              gradient: SweepGradient(colors: const <Color>[
                                Colors.blue,
                                Colors.green,
                                Colors.red
                              ], stops: const <double>[
                                0.0,
                                0.5,
                                1
                              ]))
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                              value: data.temperature,
                              needleLength: 0.95,
                              enableAnimation: true,
                              animationType: AnimationType.ease,
                              needleStartWidth: 1.5,
                              needleEndWidth: 6,
                              needleColor: Colors.red,
                              knobStyle: KnobStyle(
                                  knobRadius: 0.09,
                                  sizeUnit: GaugeSizeUnit.factor))
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Column(children: <Widget>[
                                Text(data.temperature.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 100),
                                Text('°C',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))
                              ])),
                              angle: 90,
                              positionFactor: 0.75)
                        ])
                  ]),
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

  @override
  void labelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '0') {
      args.text = '';
      args.labelStyle = GaugeTextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14);
    } else if (args.text == '10')
      args.text = '';
    else if (args.text == '20')
      args.text = 'E';
    else if (args.text == '30')
      args.text = '';
    else if (args.text == '40')
      args.text = 'S';
    else if (args.text == '50')
      args.text = '';
    else if (args.text == '60')
      args.text = 'W';
    else if (args.text == '70') args.text = '';
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
          Text(
            title!,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            value!,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
