import 'package:fruits_ecommerce/features/checkout/domain/enities/shipping_address_entity.dart';

class ShippingAddressModel {
   String? name;
   String? email;
   String? address;
   String? phone;
   String? city;
   String? addressDetails;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.city,
    required this.addressDetails,
  });

  factory ShippingAddressModel.fromEntity(
      ShippingAddressEntity shippingAddressEntity){
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      email: shippingAddressEntity.email,
      address: shippingAddressEntity.address,
      phone: shippingAddressEntity.phone,
      city: shippingAddressEntity.city,
      addressDetails: shippingAddressEntity.addressDetails
    );
  }

  toJson(){
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'city': city,
      'addressDetails': addressDetails
    };
  }
}
