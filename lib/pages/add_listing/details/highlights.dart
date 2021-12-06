import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/add_listing/styles/text_input_container.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';

import 'details_provider.dart';

class Highlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailsProvider>(context);
    return Column(
      children: [
        Column(
            children: List<Widget>.generate(
          provider.highlightsNo,
          (index) => InputListing(
            inputChanged: (val, type) => provider.inputHighlights(index, val),
            placeholder: 'Highlight ${index + 1}',
            isNum: false,
            type: 'highlights',
            validationFn: provider.highlightsValidator,
            hint: 'Special feature of listing',
          ),
        )),
        SizedBox(height: 25),
        NepekButton(
          onClick: () => provider.increaseHighlight(context),
          label: 'New Highlight',
        ),
        SizedBox(height: 100)
      ],
    );
  }
}
