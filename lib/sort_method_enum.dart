import 'package:flutter_tutorial/jsonresponse_model.dart';

enum SortMethodEnum {
  ascById,
  descById,
  ascByName,
  descByName,
  ascByUserName,
  descByUserName;

  void sortMethod(
    List<JsonResponseModel> selectedList,
    SortMethodEnum sortMethodEnum,
  ) {
    switch (sortMethodEnum) {
      case ascById:
        selectedList.sort((a, b) => a.id.compareTo(b.id));
        break;
      case descById:
        selectedList.sort(((a, b) => b.id.compareTo(a.id)));
        break;
      case ascByName:
        selectedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case descByName:
        selectedList.sort((a, b) => b.name.compareTo(a.name));
        break;
      case ascByUserName:
        selectedList.sort((a, b) => a.username.compareTo(b.username));
        break;
      case descByUserName:
        selectedList.sort((a, b) => b.username.compareTo(a.username));
        break;
    }
  }
}
