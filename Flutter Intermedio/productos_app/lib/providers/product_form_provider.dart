import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFromProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;

  ProductFromProvider(this.product);


  updateAvailability(bool value){
    product.available = value;
    notifyListeners();
  }

  bool isValidForm(){

    

    return formKey.currentState?.validate() ?? false;
  }
}