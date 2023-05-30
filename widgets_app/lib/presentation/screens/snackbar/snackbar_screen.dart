import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Buen dia.'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar
    );
  }

  void openDialog(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Que Eres un pro Player en valorant?'),
        actions: [
          TextButton(
            child: const Text('NO :c'),
            onPressed: () => context.pop(), 
          ),
          FilledButton(
            child: const Text('Claro Si :D'),
            onPressed: () => context.pop(),
          )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              child: const Text('Licencias Usadas'),
              onPressed: () {
                showAboutDialog(
                  context: context,
                );
              },
            ),

            FilledButton.tonal(
              child: const Text('Mostar Dialogo'),
              onPressed: () => openDialog(context),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
}