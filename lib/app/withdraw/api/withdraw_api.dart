import 'package:loan_app/app/withdraw/model/withdraw_histroy_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class WithdrawApi {
  static Future<bool> withdrawApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).post(
        ApiUrls.withdraws,
        body: body,
        code: 200,
      );
      if (response != null) {
        return true;
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'withdraw amount Info', error: e);
      return false;
    }
    return false;
  }

  static Future<WithdrawHistoryModel?> getWithdrawalHistory() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.withdrawsHistory,
        code: 200,
      );
      if (response != null) {
        return WithdrawHistoryModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'withdraw history info', error: e);
      return null;
    }
    return null;
  }
}
