import 'package:loan_app/app/recharge/model/recharge_bank_options_model.dart';
import 'package:loan_app/app/recharge/model/recharge_mobile_bank_options_model.dart';
import 'package:loan_app/backend/api_method/api_method.dart';
import 'package:loan_app/backend/api_urls/api_urls.dart';
import 'package:loan_app/backend/error_message/error_message.dart';

class RechargeOptionApi {
  static Future<RechargeBankOptionsModel?> getRechargeBankOptions() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.rechargeBankOption,
        code: 200,
      );
      if (response != null) {
        return RechargeBankOptionsModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'recharge bank info', error: e);
      return null;
    }
    return null;
  }

  static Future<RechargeMobileBankOptionsModel?>
      getRechargeMobileBankingOptions() async {
    Map<String, dynamic>? response;
    try {
      response = await ApiMethod(isBasic: false).get(
        ApiUrls.rechargeMobileBankingOption,
        code: 200,
      );
      if (response != null) {
        return RechargeMobileBankOptionsModel.fromJson(response);
      }
    } catch (e) {
      ErrorMessage.message(apiName: 'recharge mobile banking info', error: e);
      return null;
    }
    return null;
  }


}
