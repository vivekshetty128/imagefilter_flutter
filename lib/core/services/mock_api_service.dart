import 'package:flutter/services.dart';
import 'package:imagefilter_flutter/core/models/image_list_response_model.dart';

class MockApiService {
  List<ImageListModel> imagesList = [];

  Future<List<ImageListModel>?> loadAllTheImages() async {
    try {
      String data =
          await rootBundle.loadString('assets/mock_data/images_list.json');
      imagesList = imageListResponseFromJson(data).data ?? [];
      return imagesList;
    } catch (e) {
      return [];
    }
  }
}
