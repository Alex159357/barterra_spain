abstract class ScreenStatus{
  const ScreenStatus();

}

class DefaultScreenStatus extends ScreenStatus{
  const DefaultScreenStatus();
}

class LoadingScreenStatus extends ScreenStatus{}

class MessageDialogScreenStatus extends ScreenStatus{
  final String message;

  MessageDialogScreenStatus(this.message);
}

class ErrorDialogScreenStatus extends ScreenStatus{
  final String message;

  ErrorDialogScreenStatus(this.message);
}