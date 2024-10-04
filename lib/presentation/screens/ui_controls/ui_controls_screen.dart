import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text("Developer mode"),
            subtitle: const Text("Additional controls"),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        RadioListTile(
            title: const Text("By car"),
            subtitle: const Text("Travel by car"),
            value: Transportation.car,
            groupValue: selectedTransportation,
            onChanged: (value) {
              setState(() {
                selectedTransportation = Transportation.car;
              });
            }),
        RadioListTile(
            title: const Text("By plane"),
            subtitle: const Text("Travel by plane"),
            value: Transportation.plane,
            groupValue: selectedTransportation,
            onChanged: (value) {
              setState(() {
                selectedTransportation = Transportation.plane;
              });
            }),
        RadioListTile(
            title: const Text("By boat"),
            subtitle: const Text("Travel by boat"),
            value: Transportation.boat,
            groupValue: selectedTransportation,
            onChanged: (value) {
              setState(() {
                selectedTransportation = Transportation.boat;
              });
            }),
        RadioListTile(
            title: const Text("By submarine"),
            subtitle: const Text("Travel by submarine"),
            value: Transportation.submarine,
            groupValue: selectedTransportation,
            onChanged: (value) {
              setState(() {
                selectedTransportation = Transportation.submarine;
              });
            }),
      ],
    );
  }
}
