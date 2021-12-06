import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/add_listing/main.dart';
import 'package:nepek_buyer/pages/add_listing/state/add_listing_state.dart';
import 'package:nepek_buyer/pages/add_listing/styles/appBar.dart';
import 'package:nepek_buyer/pages/add_listing/styles/dropdown_container.dart';
import 'package:nepek_buyer/pages/add_listing/styles/floating_action_button.dart';
import 'package:nepek_buyer/pages/add_listing/styles/text_input_container.dart';
import 'package:provider/provider.dart';

import 'specifications_provider.dart';

class SpecificationLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpecificationsProvider(),
      child: SpecificationLayoutRoot(),
    );
  }
}

class SpecificationLayoutRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ListingData>(context);
    final provider = Provider.of<SpecificationsProvider>(context);
    if (provider.init == false) {
      provider.specifications = product.currentSpecifications;
      provider.initInject(product.currentSpecifications);
      provider.init = true;
    }
    return OnBackPressedPop(
      child: Scaffold(
        appBar: cancelAppBar(context, 'Specifications'),
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            physics: BouncingScrollPhysics(),
            children: [
              ...provider.specifications.map(
                (e) {
                  // provider.checkOther(e['label']));
                  return e['values'].length > 0
                      ? Column(
                          children: [
                            DropDownContainer(
                              heading: e['label'],
                              dataList: [
                                ...e['values'],
                                {'label': 'Other'}
                              ],
                              // current: e['values'][0],
                              current: provider.getCurrentVal(e['label']),
                              dropDownChanged: (value, of) =>
                                  provider.specificationChanged(value, of),
                            ),
                            provider.checkOther(e['label'])
                                ? InputListing(
                                    placeholder: 'Other ${e['label']}',
                                    type: e['label'],
                                    inputChanged: (String val, String of) =>
                                        provider.otherSpecificationInput(
                                            val, of),
                                  )
                                : Container()
                          ],
                        )
                      : Container();
                },
              ).toList(),
              SizedBox(height: 150)
            ],
          ),
        ),
        floatingActionButton: AddProductNextBtn(
          onPressed: () {
            if (provider.checkOthersInputValue(context) == true) {
              product.currentSpecifications = provider.sendingSpecifications;
              product.setNextScreen(context, 5);

              // yesNoFn(int screen) {
              //   product.setNextScreen(context, screen);
              //   Navigator.of(context).pop();
              // }

              // yesNoPopUpWithNoFunction(
              //   context,
              //   'Does your product has variants?\n\n(Are there options for your products?)',
              //   () => yesNoFn(4),
              //   () => yesNoFn(5),
              // );

            }
          },
        ),
      ),
    );
  }
}
