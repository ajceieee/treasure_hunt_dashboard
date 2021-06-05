import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function? onChanged;
  final Function? onEditingCompleted;
  TextEditingController? controller;
  SearchBarWidget({
    this.onEditingCompleted,
    @required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          Form(
            child: TextFormField(
              onChanged: (text) {
                onChanged!(text);
              },
              textInputAction: TextInputAction.go,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Theme.of(context).focusColor.withOpacity(0.8)),
                prefixIcon: Icon(Icons.search,
                    size: 20, color: Theme.of(context).hintColor),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
