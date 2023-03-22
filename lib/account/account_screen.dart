import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_signal_flutter/account/bloc/account_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AccountBloc(), child: const AccountScreenForm(),);
  }
}

class AccountScreenForm extends StatefulWidget {
  const AccountScreenForm({Key? key}) : super(key: key);

  @override
  State<AccountScreenForm> createState() => _AccountScreenFormState();
}

class _AccountScreenFormState extends State<AccountScreenForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

