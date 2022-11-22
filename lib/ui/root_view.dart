import 'package:flutter/material.dart';
import 'package:imagefilter_flutter/core/controllers/GalleryViewModel.dart';
import 'package:imagefilter_flutter/ui/shared/styles.dart';
import 'package:imagefilter_flutter/ui/widgets/gallery_view.dart';
import 'package:imagefilter_flutter/ui/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView>
    with SingleTickerProviderStateMixin {
  List<String> tabsNameList = ['All', 'Mountains', 'Birds', 'Animals', 'Food'];

  late TabController _tabController;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _tabController = TabController(vsync: this, length: tabsNameList.length);

    _tabController.addListener(() {
      context.read<GalleryViewModel>().onTabChange(
          tabsNameList.elementAt(_tabController.index).toLowerCase());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 54.0,
                child: CustomSearchBar(
                  onSearch: () {
                    final searchedTab = tabsNameList.where((element) {
                      return element.toLowerCase() ==
                          _textEditingController.text.toLowerCase();
                    });
                    if (searchedTab.isNotEmpty) {
                      _tabController.index =
                          tabsNameList.indexOf(searchedTab.first);
                      context.read<GalleryViewModel>().onTabChange(
                          _textEditingController.text.toLowerCase(),
                          isSearching: true);
                    } else {
                      context
                          .read<GalleryViewModel>()
                          .setIsSearchingenabled(false);
                    }
                  },
                  textEditingController: _textEditingController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<GalleryViewModel>(builder: (context, viewModel, _) {
                return viewModel.isSearchingEnabled
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Search Result for "${_textEditingController.text}"',
                              style: fontFamilyPoppinsMedium.size16.colorBlack,
                            ),
                          ),
                        ],
                      )
                    : TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        onTap: ((value) {
                          context
                              .read<GalleryViewModel>()
                              .onTabChange(tabsNameList[value].toLowerCase());
                        }),
                        tabs: tabsNameList.map<Tab>((element) {
                          return Tab(
                            child: Text(
                              element,
                              style: fontFamilyPoppinsMedium.size14.colorBlack,
                            ),
                          );
                        }).toList(),
                      );
              }),
              Expanded(
                child: Consumer<GalleryViewModel>(
                    builder: (context, viewModel, _) {
                  return viewModel.isSearchingEnabled
                      ? const GalleryView()
                      : TabBarView(
                          controller: _tabController,
                          children: tabsNameList.map<Widget>((String name) {
                            return const GalleryView();
                          }).toList());
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
