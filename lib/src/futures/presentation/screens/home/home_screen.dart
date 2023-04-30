import 'package:barterra2/src/futures/presentation/blocs/auth/auth_bloc.dart';
import 'package:barterra2/src/futures/presentation/blocs/auth/auth_state.dart';
import 'package:barterra2/src/utils/extantions/context_extantion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../blocs/auth/authentitication_status.dart';
import '../../blocs/screen_status/screen_status_cubit.dart';
import '../../blocs/screen_status/screen_status_state.dart';
import '../../widgets/screen_status_widget/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.authBloc.init;
    return Stack(
      children: [
        Scaffold(
          body: _getBody,
          bottomNavigationBar: _bottomNavBar,
        ),
        _getScreenStatusView
      ],
    );
  }

  Widget get _getBody => BlocBuilder<AuthBloc, AuthState>(builder: _bodyBuilder,);
  Widget get _bottomNavBar => BlocBuilder<AuthBloc, AuthState>(builder: _bottomNavBuilder,);
  Widget get _getScreenStatusView => BlocBuilder<ScreenStatusCubit, ScreenStatus>(builder: _getScreenStatusBuilder);


  Widget _bodyBuilder(BuildContext context, AuthState state) {
    return Center(child: Column(
      children: [
        Text(state.authenticationStatus.runtimeType.toString()),
        TextButton(onPressed: context.authBloc.trySignIn, child: const Text("SignIn check")),
        TextButton(onPressed: context.authBloc.trySignOut, child: const Text("SignOut check")),
        TextButton(onPressed: context.authBloc.trySignUp, child: const Text("SignUp check")),
      ],
    ));
  }

  Widget _bottomNavBuilder(BuildContext context, AuthState state) {
    return BottomNavigationBar(
        items: [
      const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "1"),
      const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "2"),
      const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "3"),
      if (state.authenticationStatus is AuthStatusAuthenticated)
          const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "4")
    ]);
  }

  Widget _getScreenStatusBuilder(BuildContext context, ScreenStatus state) {
    switch(state.runtimeType){
      case LoadingScreenStatus: return const LoadingWidget();
      case MessageDialogScreenStatus: return Container(color:  Colors.orange,);
      case ErrorDialogScreenStatus: return Container(color: Colors.red,);
      default: return const SizedBox(width: 0, height: 0,);
    }
  }
}
