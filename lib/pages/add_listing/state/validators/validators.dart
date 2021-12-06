class Validators {
  String nameValidator(val) {
    if (val.isEmpty) {
      return 'Please enter product name';
    } else if (val.length > 30) {
      return 'Product Name must be less than 30 characters';
    }
    return null;
  }

  String brandValidator(val) {
    if (val.isEmpty) {
      return 'Please enter product brand';
    } else if (val.length > 10) {
      return 'Brand Name must be less than 10 characters';
    }
    return null;
  }

  String priceValidator(val) {
    if (val.isEmpty) {
      return 'Please enter price';
    } else if (RegExp(r'^[0-9]*$').hasMatch(val) == false) {
      return 'Please enter valid price';
    }
    return null;
  }

  String qtyValidator(val) {
    if (val.isEmpty) {
      return 'Please enter product quantity';
    } else if (RegExp(r'^[0-9]*$').hasMatch(val) == false) {
      return 'Please enter valid Quantity';
    }
    return null;
  }

  String descriptionValidator(val) {
    if (val.isEmpty) {
      return 'Please enter description';
    }
    return null;
  }
}
