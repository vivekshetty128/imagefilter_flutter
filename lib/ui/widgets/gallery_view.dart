import 'package:flutter/material.dart';
import 'package:imagefilter_flutter/core/controllers/GalleryViewModel.dart';
import 'package:imagefilter_flutter/ui/shared/styles.dart';
import 'package:imagefilter_flutter/ui/widgets/fullscreen_imageview.dart';
import 'package:imagefilter_flutter/ui/widgets/image_view.dart';
import 'package:provider/provider.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryViewModel>(builder: (context, viewModel, index) {
      return viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : GridView.builder(
              itemCount: viewModel.imageList.length,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => FullScreenImageView(
                                imageUrl: viewModel.imageList[index].url!,
                              )))),
                  child: ImageView(
                    imageName: viewModel.imageList[index].url!,
                  ),
                );
              }));
    });
  }
}
