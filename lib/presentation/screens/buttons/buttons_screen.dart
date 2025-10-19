import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: context.pop,
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Wrap(
        spacing: 10,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Elevated')),
          ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Elevated Icon'),
            icon: Icon(Icons.access_alarm_outlined),
          ),
          FilledButton(onPressed: () {}, child: Text('Filled')),
          FilledButton.icon(
            onPressed: () {},
            label: Text('Filled Icon'),
            icon: Icon(Icons.airplanemode_inactive_outlined),
          ),
          OutlinedButton(onPressed: () {}, child: Text('Outline')),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text('Outline Icon'),
            icon: Icon(Icons.book_online_outlined),
          ),
          TextButton(onPressed: () {}, child: Text('Text')),
          TextButton.icon(
            onPressed: () {},
            label: Text('Text Icon'),
            icon: Icon(Icons.now_widgets),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.visibility_sharp)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_sharp),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.primary),
              iconColor: WidgetStatePropertyAll(Colors.white),
            ),
          ),

          // ** Custom Buttom
          const CustomButton(),
        ],
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
            child: Text('Hola Mundo', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
