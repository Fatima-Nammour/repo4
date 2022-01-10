import 'package:dio/dio.dart';
import 'package:taskf/app/core/widgets/show_dialog_app.dart';

class ShowErrorMessage {
  static Future<void> showErrMSG(String message, context) async {
    await ShowDialogApp.showDialogApp(
        context: context, text: message, okMethod: () {}, cancelMethod: () {});
  }
}

class MyDioError {
  static String returnErrorType(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      return "Connect Timeout";
    } else if (e.type == DioErrorType.cancel) {
      return 'Your Request was canceled';
    } else if (e.type == DioErrorType.receiveTimeout) {
      return 'Receive Timeout';
    } else if (e.type == DioErrorType.sendTimeout) {
      return 'Send Timeout';
    } else if (e.type == DioErrorType.other) {
      return 'Something wrong!, please try again';
    } else if (e.response!.statusCode == 404) {
      return "User Not found";
    } else if (e.response!.statusCode == 409) {
      return "User already exist";
    } else {
      return 'Invalid value';
    }
  }
}
