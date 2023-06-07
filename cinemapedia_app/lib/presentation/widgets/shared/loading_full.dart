import 'package:flutter/material.dart';

class LoadingFull extends StatelessWidget {
  const LoadingFull({super.key});

  Stream<String> getLoadingMessages() {

    final messages = <String>[
      "Cargando Peliculas...",
      "Comprando Palomitas...",
      "Cargando Populares...",
      "Ya Estamos Listo...",
      "Ups, estamos tardando...",
    ];
    
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if( !snapshot.hasData ) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          )

        ],
      ),
    );
  }
}