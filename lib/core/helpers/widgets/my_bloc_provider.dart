import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocProvider<T extends StateStreamableSource<Object?>>
    extends StatelessWidget {
  const MyBlocProvider({
    required this.child,
    super.key,
    required this.bloc,
  });
  final Widget Function(BuildContext context) child;
  final T bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Builder(
        builder: (context) => child(context),
      ),
    );
  }
}
