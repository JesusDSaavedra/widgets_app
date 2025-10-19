import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      duration: Duration(seconds: 2),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      content: Text('Hola Mundo'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void viewDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¿Estas seguro?'),
        content: Text(
          'Enim qui veniam nulla enim ea. Quis veniam minim adipisicing consequat aliquip incididunt aliqua irure do occaecat ad sint. Aliqua anim quis anim voluptate eu ullamco ea qui. Aliqua aute laborum ex aliquip enim. Anim aute ad occaecat tempor proident sit exercitation eu excepteur commodo elit irure.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar & Dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Minim culpa qui laboris et non excepteur esse irure eu laborum quis. Qui non magna irure nulla sit mollit amet occaecat sit labore labore duis. Magna laboris ad officia dolor dolore voluptate excepteur reprehenderit cupidatat est nulla ut ad adipisicing. Nostrud ullamco voluptate consectetur fugiat dolore dolor sunt laboris do. Sint proident dolore reprehenderit ea qui eiusmod sint consequat nulla.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton(
              onPressed: () => viewDialog(context),
              child: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
