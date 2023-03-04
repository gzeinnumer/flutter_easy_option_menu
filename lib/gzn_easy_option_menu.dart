// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

class ItemOptionModel {
  int unique;
  String label;

  ItemOptionModel({
    required this.unique,
    required this.label,
  });
}

class EasyOptionMenu extends StatefulWidget {
  List<ItemOptionModel> list;
  List<ItemOptionModel> listReal = [];
  String title;
  String subTitle;

  EasyOptionMenu({
    Key? key,
    required this.list,
    this.title = "",
    this.subTitle = "",
  }) : super(key: key);

  @override
  State<EasyOptionMenu> createState() => _EasyOptionMenuState();
}

class _EasyOptionMenuState extends State<EasyOptionMenu> {
  @override
  void initState() {
    super.initState();
    widget.listReal = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      elevation: 0.0,
      content: content(context),
    );
  }

  Widget content(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _section1(widget.title, widget.subTitle),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.list.map((e) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context, e);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(e.label),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox space16() {
    return const SizedBox(height: 16);
  }

  Widget _section1(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            title.isNotEmpty ? Text(title, style: const TextStyle(fontWeight: FontWeight.bold)) : Container(),
            title.isNotEmpty ? const SizedBox(height: 5) : Container(),
            subTitle.isNotEmpty ? Text(subTitle) : Container(),
            subTitle.isNotEmpty ? space16() : Container(),
          ],
        ),
        InkWell(
          child: const Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
