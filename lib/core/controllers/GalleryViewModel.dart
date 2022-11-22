import 'package:flutter/material.dart';
import 'package:imagefilter_flutter/core/models/image_list_response_model.dart';
import 'package:imagefilter_flutter/core/services/mock_api_service.dart';
import 'package:imagefilter_flutter/core/services/locator.dart';

class GalleryViewModel extends ChangeNotifier {
  final mockApiService = locator<MockApiService>();

  bool isBusy = false;
  List<ImageListModel> _imageList = [];

  List<ImageListModel> get imageList => _imageList;

  bool isSearchingEnabled = false;

  GalleryViewModel() {
    loadImages();
  }

  Future<void> loadImages() async {
    setBusy(true);
    _imageList = await mockApiService.loadAllTheImages() ?? [];
    setBusy(false);
  }

  setBusy(bool value) {
    isBusy = value;
    notifyListeners();
  }

  setIsSearchingenabled(bool value) {
    isSearchingEnabled = value;
    notifyListeners();
  }

  onTabChange(String tabName, {bool isSearching = false}) {
    setBusy(true);
    isSearchingEnabled = isSearching;
    if (tabName == "all") {
      _imageList = mockApiService.imagesList;
    } else {
      _filterImageList(tabName);
    }
    setBusy(false);
  }

  _filterImageList(String type) {
    _imageList = mockApiService.imagesList
        .where((element) => element.imageType == type)
        .toList();
  }
}
