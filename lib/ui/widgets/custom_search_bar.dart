import 'package:flutter/material.dart';
import 'package:imagefilter_flutter/ui/shared/styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function onSearch;

  CustomSearchBar({
    Key? key,
    required this.textEditingController,
    required this.onSearch,
  }) : super(key: key);

  final _outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        onFieldSubmitted: (_) => _onSearch(),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () => _onSearch(),
              child: const Icon(Icons.search, color: Colors.black)),
          hintText: "Search keywords",
          hintStyle: fontFamilyPoppinsRegular.size16.colorGrey,
          filled: true,
          enabledBorder: _outlineBorder,
          focusedBorder: _outlineBorder,
          border: _outlineBorder,
        ));
  }

  _onSearch() {
    onSearch.call();
  }
}
