//lotfy

import 'package:flutter_proj/models/address.dart';

class AddressRepository{


  List<Address> getAddresses(){
    return const[
      Address(
        id: '1',
        label: 'Home' ,
        fullAddress: '123 main Street,Apt 48',
        city: 'Egypt',
        state: ' EG ' ,
        zipCode: ' 10001 ',
        isDefault: true ,
        type : AddressType.home,
      ),
      Address(
        id: '2' ,
        label: 'office' ,
        fullAddress: '324 Business Ave ,suite 200',
        city: 'Egypt',
        state: ' EG ' ,
        zipCode: ' 10002 ',
        type : AddressType.office,
      ),
    ];


  }
  Address ? getDefaultAddress(){
    return getAddresses().firstWhere(
          (address)=> address.isDefault,
      orElse: ()=> getAddresses().first,
    );
  }
}