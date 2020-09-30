
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keyless2/model/Device.dart';

class myAddedDevices extends StatefulWidget {
  @override
  _myAddedDevicesState createState() => _myAddedDevicesState();
}

class _myAddedDevicesState extends State<myAddedDevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("my Devices"),
          backgroundColor: Color(0xffB8141F),
        ),
        body: WatchBoxBuilder(
          box: Hive.box('devices'),
          builder: (context, deviceBox) {
            return ListView.builder(
              itemCount: deviceBox.length,
              itemBuilder: (BuildContext context, int index) {
                final device = deviceBox.getAt(index) as Device;

                return ListTile(
                  title: Text(device.name),
                  subtitle: Text('Meters: '+device.meters.toString()+"m Auto: "+device.auto.toString()),
                );
              },
            );
          },
        ),
    );
  }
}
