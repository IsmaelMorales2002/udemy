import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier{

  final String _baseUrl = 'flutter-varios-b6d3d-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService(){
    loadProducts();
  }

  Future <List<Product>>loadProducts()async{

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);
    
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
    return products;

  }

  Future saveOncreate(Product product) async{
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      //Es necesario crear
      await createProduct(product);
    }else{
      //Actializar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();

  }

  Future<String> updateProduct(Product product) async{
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url,body: product.toJson());
    final decodeData = resp.body;

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async{
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url,body: product.toJson());
    final decodeData = json.decode(resp.body);

    product.id = decodeData['name'];
    products.add(product);
    return product.id!;
  }


  void updateSelectedProductImage(String path){

    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();

  }

  Future<String?> uploadImage() async{

    if(newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/morales503/image/upload?upload_preset=ml_default');

    final imageUploadRequiest = http.MultipartRequest('POST',url);

    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequiest.files.add(file);

    final streamResponse = await imageUploadRequiest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if( resp.statusCode != 200 && resp.statusCode != 201){
      print('algo salio mal');
      return null;
    }
  
    newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}