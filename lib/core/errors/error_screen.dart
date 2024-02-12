import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen(this.error, this.stack, {super.key});
  final dynamic error;
  final StackTrace stack;
  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shoppi'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.error.toString(),
              ),
              60.verticalSpace,
              Text(
                widget.stack.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
