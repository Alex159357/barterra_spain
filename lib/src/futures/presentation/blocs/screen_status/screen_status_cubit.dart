import 'package:bloc/bloc.dart';

import 'screen_status_state.dart';

class ScreenStatusCubit extends Cubit<ScreenStatus> {
  ScreenStatusCubit() : super(const DefaultScreenStatus());


  void showLoadingScreen() => emit(LoadingScreenStatus());

  void hideLoadingScreen() => emit(const DefaultScreenStatus());

  void showMessageDialog({required String message}) => emit(MessageDialogScreenStatus(message));

  void showErrorDialog({required String message}) => emit(ErrorDialogScreenStatus(message));

}
