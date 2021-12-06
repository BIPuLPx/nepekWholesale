// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/popUps/yes_no.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';
import 'package:provider/provider.dart';
import 'add_image/main.dart';
import 'classify/main.dart';
import 'details/details_layout.dart';
import 'final_view/main.dart';
import 'specifications/specifications_layout.dart';
import 'state/add_listing_state.dart';

class AddListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListingData>(
      create: (context) => ListingData(),
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListingData _provider = Provider.of(context);
    if (!_provider.syncedClassification) _provider.init();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: _provider.body,
        ),
      ),
    );
  }
}

class OnBackPressedPop extends StatelessWidget {
  final Widget child;
  const OnBackPressedPop({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        yesFn() {
          showErrorToast(context, 'Product Cancelled');
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }

        yesNoPopUp(
          context,
          'Do you sure want  to cancel product registration ?',
          yesFn,
        );
        return null;
      },
      child: child,
    );
  }
}

class AddListingForm extends StatefulWidget {
  @override
  _AddListingFormState createState() => _AddListingFormState();
}

class _AddListingFormState extends State<AddListingForm> {
  Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ListingData>(context);
    switch (product.currentScreen) {
      case 1:
        return Classify();
      case 2:
        return DetailsLayout();
      case 3:
        return SpecificationLayout();
      // case 4:
      // return Options();
      case 5:
        return AddImage();

      case 6:
        return FinalView();

      default:
        return Classify();
    }
  }
}
