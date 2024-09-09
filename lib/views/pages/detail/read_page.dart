import 'package:flutter/widgets.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget.setContentBackground(context: context, child: const Text('data'));
  }
}
