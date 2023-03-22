import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/library_bloc.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LibraryBloc(), child: const LibraryScreenForm(),);
  }
}

class LibraryScreenForm extends StatefulWidget {
  const LibraryScreenForm({Key? key}) : super(key: key);

  @override
  State<LibraryScreenForm> createState() => _LibraryScreenFormState();
}

class _LibraryScreenFormState extends State<LibraryScreenForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

