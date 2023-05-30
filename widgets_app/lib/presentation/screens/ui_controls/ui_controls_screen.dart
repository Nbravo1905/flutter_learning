import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),

      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submari}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool breakfast = false;
  bool lunch  = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Developer'),
          value: isDeveloper, 
          onChanged: ((value) => setState(() => isDeveloper = !isDeveloper) )
        ),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Card'),
              subtitle: const Text('Viajar Por Carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              })
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar Por Barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              })
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar Por Avion'),
              value: Transportation.plane, 
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              })
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar Por Submarino'),
              value: Transportation.submari,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submari;
              })
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: breakfast, 
          onChanged: (value) => setState(() {
            breakfast = !breakfast;
          })
        ),

        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: lunch, 
          onChanged: (value) => setState(() {
            lunch = !lunch;
          })
        ),

        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: dinner, 
          onChanged: (value) => setState(() {
            dinner = !dinner;
          })
        ),

      ],
    );
  }
}