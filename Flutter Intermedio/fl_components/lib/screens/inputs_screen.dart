import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormeKey = GlobalKey<FormState>();

   final Map<String,String> formValues={
    'first_name' : 'Ismael',
    'last_name'  : 'Morales',
    'email'      : 'ismael@google.com',
    'password'   : '123456',
    'role'       : 'Admin'
  };


    return Scaffold(
      appBar: AppBar(
        title: const Text('Inpust y Forms'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormeKey,
            child: Column(
              children: [
          
                CustomInputField(hintText: 'Nombre de Usuario',labelText: 'Nombre', formProperty: 'first_name', formValues: formValues,),
                const SizedBox(height: 30,), 
                CustomInputField(hintText: 'Apellido de Usuario',labelText: 'Apellido', formProperty: 'last_name', formValues: formValues,),
                const SizedBox(height: 30,), 
                CustomInputField(hintText: 'Correo del Usuario',labelText: 'Correo Electronico',keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues,),
                const SizedBox(height: 30,), 
                CustomInputField(hintText: 'Contraseña del Usuario',labelText: 'Contraseña',keyboardType: TextInputType.emailAddress,obscureText: true, formProperty: 'password', formValues: formValues,),
                const SizedBox(height: 30,),

                DropdownButtonFormField<String>(
                  items: const[
                    DropdownMenuItem(value: 'Admin',child: Text('Admin'),),
                    DropdownMenuItem(value: 'Superuser',child: Text('Superuser'),),
                    DropdownMenuItem(value: 'Developer',child: Text('Developer'),),
                    DropdownMenuItem(value: 'Jr. Developer',child: Text('Jr. Developer'),)
                ], 
                onChanged: (value){
                  print(value);
                  formValues['role'] = value ?? 'Admin';
                }),
          
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child:Center(child: Text("Guardar"))
                    ),
                  onPressed: (){

                    FocusScope.of(context).requestFocus(FocusNode());

                    if(!myFormeKey.currentState!.validate()){
                      print('Formulario no válido');
                      return;
                    }

                    print(formValues);
                  },
          
                  )
          
              ],
            ),
          ),
          ),
      )
    );
  }
}

