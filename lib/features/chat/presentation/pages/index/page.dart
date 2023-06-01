import 'package:flutter/material.dart';
import 'package:shamo_mobile/core/core.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Support')),
      body: const EmptyWidget(
        image: MainAssets.headset,
        title: 'Opss no message yet?',
        desc: 'You have never done a transaction',
      ),
    );
  }
}
