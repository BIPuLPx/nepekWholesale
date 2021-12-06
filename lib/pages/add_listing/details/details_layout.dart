import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/add_listing/state/add_listing_state.dart';
import 'package:nepek_buyer/pages/add_listing/styles/appBar.dart';
import 'package:nepek_buyer/pages/add_listing/styles/floating_action_button.dart';
import 'package:nepek_buyer/pages/add_listing/styles/text_input_container.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'details_provider.dart';
import 'highlights.dart';

class DetailsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: DetailsLayoutRoot(),
    );
  }
}

class DetailsLayoutRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ListingData>(context);
    final provider = Provider.of<DetailsProvider>(context);
    return OnBackPressedPop(
      child: Scaffold(
        appBar: cancelAppBar(context, 'Details'),
        backgroundColor: Colors.white,
        body: Form(
          key: provider.detailsKey,
          autovalidateMode: provider.autoValidateDetails
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          // autovalidate: provider.autoValidateDetails,
          child: Container(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: <Widget>[
                InputListing(
                  minLines: 2,
                  maxLines: 15,
                  inputChanged: provider.setDetails,
                  initialValue: provider.details['name'],
                  placeholder: 'Listing Name',
                  type: 'listingName',
                  validationFn: provider.nameValidator,
                  hint:
                      'Give names which can be identified while searching , names can be of muliple words',
                ),
                InputListing(
                  inputChanged: provider.setDetails,
                  placeholder: 'Price',
                  currentVal: provider.details['price'],
                  isNum: true,
                  type: 'price',
                  isPrice: true,
                  validationFn: provider.priceValidator,
                  hint: 'Write price in NPR',
                ),
                InputListing(
                  minLines: 5,
                  maxLines: 20,
                  inputChanged: provider.setDetails,
                  currentVal: provider.details['description'],
                  placeholder: 'Description',
                  type: 'description',
                  validationFn: provider.descriptionValidator,
                  hint:
                      'Write decription for viewers from which they can identify your listing',
                ),
                Highlights()
              ],
            ),
          ),
        ),
        floatingActionButton: AddProductNextBtn(
          onPressed: () {
            if (provider.detailsKey.currentState.validate()) {
              provider.injectHightlights();
              product.currentDetails = provider.details;
              if (product.currentSpecifications.length > 0)
                product.setNextScreen(context, 3);
              else {
                if (product.currentOptions.length > 0)
                  product.setNextScreen(context, 4);
                else
                  product.setNextScreen(context, 5);
              }
            } else {
              provider.autoValidate();
            }
          },
        ),
      ),
    );
  }
}
