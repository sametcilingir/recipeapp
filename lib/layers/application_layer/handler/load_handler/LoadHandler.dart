import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

import 'enum/ViewStateEnum.dart';

@lazySingleton
class LoadHandler {
  void changeViewState(ViewStateEnum viewState) {
    switch (viewState) {
      case ViewStateEnum.IDLE:
        EasyLoading.dismiss();
        break;
      case ViewStateEnum.BUSY:
        EasyLoading.show(
          status: 'Loading...',
          dismissOnTap: false,
        );
        break;
      case ViewStateEnum.ERROR:
        EasyLoading.showError('Error');
        break;
    }
  }
}
