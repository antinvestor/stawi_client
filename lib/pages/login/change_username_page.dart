import 'package:flutter/material.dart';
import 'package:tawkie/config/subscription.dart';
import 'login.dart';

class ChangeUsernamePage extends StatefulWidget {
  final Map<String, dynamic> queueStatus;
  final LoginController controller;

  const ChangeUsernamePage(
      {super.key, required this.queueStatus, required this.controller});

  @override
  State<ChangeUsernamePage> createState() => _ChangeUsernamePageState();
}

class _ChangeUsernamePageState extends State<ChangeUsernamePage> {
  final TextEditingController _usernameController = TextEditingController();
  String? _usernameError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            widget.queueStatus['userState'] == 'IN_QUEUE'
                ? Column(
                    children: [
                      Text(
                        'Your position in the list:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        widget.queueStatus['queuePosition'].toString(),
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  )
                : Text(
                    "It's your turn!",
                    style: TextStyle(fontSize: 23),
                  ),
            const SizedBox(height: 10),
            Text(
              'Choose your Tawkie name',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _usernameError,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final newUsername = _usernameController.text;

                if (_usernameController.text.isEmpty) {
                  setState(() {
                    _usernameError = 'Username cannot be empty';
                  });
                  return;
                } else {
                  setState(() {
                    _usernameError = null;
                  });
                }

                // Function to update the username
                final result =
                    await widget.controller.changeUserNameOry(newUsername);

                print("Result: $result");
                if (result == 'success') {
                  if (widget.queueStatus['userState'] == 'IN_QUEUE') {
                    SubscriptionManager().checkSubscriptionStatusAndRedirect();
                  } else if (widget.queueStatus['userState'] == 'ACCEPTED') {
                    SubscriptionManager().checkSubscriptionStatusAndRedirect();
                  }
                } else {}
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
}
