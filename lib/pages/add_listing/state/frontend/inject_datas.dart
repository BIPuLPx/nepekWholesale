import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class InjectDatas {
  Map getBackendData(
      currentDetails,
      currentClassification,
      currentSpecifications,
      currentOptions,
      deduction,
      variants,
      imgs,
      miniThumb) {
    List images = populateImages(imgs);
    Map sendData1 = {};
    sendData1['imgDir'] = uuid.v1();
    sendData1['imgs'] = images;
    sendData1['thumbnail'] = images[0];
    sendData1['miniThumb'] = miniThumb['imgName'];
    // sendData1['storeType'] = UserPreferences().getSellerType();
    // sendData1['storeName'] = UserPreferences().getStoreName();
    sendData1['productName'] = currentDetails['productName'];
    sendData1['brand'] =
        currentDetails['brand'] == '' ? 'Generic' : currentDetails['brand'];
    sendData1['brand_id'] = currentDetails['brand_id'];
    sendData1['price'] = currentDetails['price'];
    sendData1['qty'] = currentDetails['qty'];
    sendData1['classs'] = currentClassification['class']['_id'];
    sendData1['category'] = currentClassification['category']['_id'];
    sendData1['subcategory'] = currentClassification['subcategory']['_id'];
    sendData1['classLabel'] = currentClassification['class']['label'];
    sendData1['categoryLabel'] = currentClassification['category']['label'];
    sendData1['subCategoryLabel'] =
        currentClassification['subcategory']['label'];
    sendData1['warranty'] = currentDetails['warranty'];

    // sendData1['description'] = currentDetails['description'];
    sendData1['highlights'] = currentDetails['highlights'];
    if (currentSpecifications.length != 0)
      sendData1['specifications'] = currentSpecifications;
    if (currentOptions.length != 0)
      sendData1['options'] = populateOptions(currentOptions);
    if (variants != null) sendData1['variants'] = variants;

    sendData1['deduction'] = deduction;

    return sendData1;
  }

  List populateOptions(options) {
    List populatedOption = [];
    for (var option in options) {
      Map inject = {
        "name": option['name'],
        "value": [],
        'default': '',
      };
      if (option['name'] == 'Color Group')
        inject['imageKey'] = option['imgKey'];
      List optVals = option['value'];
      for (var optnVal in optVals) {
        Map addOptn = {'label': optnVal['label']};
        if (optnVal['index'] == 0) inject['default'] = optnVal['label'];
        if (option['name'] == 'Color Group')
          addOptn['imgName'] = optnVal['imgName'];
        inject['value'].add(addOptn);
      }
      populatedOption.add(inject);
    }
    return populatedOption;
  }

  // List populateVariants(variants) {
  //   for (var variant in variants) {
  //     variant.remove('index');
  //     variant.remove('value');
  //   }
  //   return variants;
  // }

  List populateImages(images) {
    List imgs = [];
    for (var img in images) {
      imgs.add(img['imgName']);
    }
    return imgs;
  }
}
