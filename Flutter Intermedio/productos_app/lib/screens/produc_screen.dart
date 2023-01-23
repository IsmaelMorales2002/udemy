import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/servides.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productServices = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) =>  ProductFromProvider(productServices.selectedProduct),
      child:  _ProductScreenBody(productServices: productServices),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productServices,
  }) : super(key: key);

  final ProductsService productServices;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFromProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [


            Stack(
              children: [
                ProducImage(url: productServices.selectedProduct.picture,),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: const Icon(Icons.arrow_back_ios_new, size: 40,color: Colors.white,)
                  )
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                  onPressed: () async{
                    final picket = ImagePicker();
                    final PickedFile? pickedFile = await picket.getImage(
                      source: ImageSource.camera,
                      imageQuality: 100
                    );

                    if(pickedFile == null){
                      return;
                    }
                    productServices.updateSelectedProductImage(pickedFile.path);
                  },
                  icon: const Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,)
                  )
                )
              ],
            ),

            _ProductForm(),
            SizedBox(height: 100,)

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: productServices.isSaving
          ? const CircularProgressIndicator(
            color: Colors.white,
          )
          : const Icon(Icons.save_outlined),
        onPressed: productServices.isSaving
          ? null
          : () async{
           if(!productForm.isValidForm())return;

           final String? imageUrl = await productServices.uploadImage();
          
            if(imageUrl != null) productForm.product.picture = imageUrl;

           productServices.saveOncreate(productForm.product);
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final prodcutForm = Provider.of<ProductFromProvider>(context);
    final product = prodcutForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: prodcutForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [

              const SizedBox( height: 10,),

              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value){
                  if(value == null || value.length < 1) 
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:'
                ),
              ),

              const SizedBox(height: 30,),

              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value){
                  if(double.tryParse(value) == null){
                    product.price = 0;
                  }else{
                    product.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
              ),

              const SizedBox(height: 30,),

              SwitchListTile.adaptive(
                value: product.available,
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: prodcutForm.updateAvailability
              ),

              SizedBox(height: 30,)

            ],
          )
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0, 5),
        blurRadius: 5
      )
    ]
  );
}