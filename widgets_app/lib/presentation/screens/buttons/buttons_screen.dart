import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.energy_savings_leaf_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [

            //ElevatedButton
            ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Button Disabled')),
            ElevatedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.usb_rounded), 
              label: const Text('Elevated Icon')
            ),

            //FilledButton
            FilledButton(
              onPressed: () {}, 
              child: const Text('Filled')
            ),
            FilledButton.icon(
              onPressed: () {}, 
              icon: const Icon( Icons.access_alarm_rounded),
              label: const Text('Filled Icon')
            ),

            //OutlinedButton
            OutlinedButton(
              onPressed: () {}, 
              child: const Text('Outlined')
            ),
            OutlinedButton.icon(
              onPressed: () {}, 
              icon: const Icon( Icons.access_alarm_rounded),
              label: const Text('Outlined Icon')
            ),

            //TextButton
            TextButton(
              onPressed: () {}, 
              child: const Text('Text')
            ),
            TextButton.icon(
              onPressed: () {}, 
              icon: const Icon( Icons.access_alarm_rounded),
              label: const Text('Text Icon')
            ),

            //IconButton
            IconButton(
              onPressed: () {}, 
              icon: const Icon( Icons.access_alarm_rounded),
            ),
            IconButton(
              onPressed: () {}, 
              icon: const Icon( Icons.access_alarm_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
            
            const CustomButton()

          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Holis', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}