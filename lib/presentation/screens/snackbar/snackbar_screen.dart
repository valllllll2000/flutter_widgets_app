import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    var snackBar = SnackBar(
      content: const Text('Hello world!'),
      action: SnackBarAction(label: 'ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Flutter dialog'),
        content: const Text(
            'Flutter code compiles to ARM or Intel machine code as well as JavaScript, for fast performance on any device. Build and iterate quickly with Hot Reload. Update code and see changes almost instantly, without losing state.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancel')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Accept'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Flutter is an open source framework for building beautiful, natively compiled, multi-platform applications from a single codebase.')
                  ]);
                },
                child: const Text('Licenses used')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Show dialog')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show snackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
