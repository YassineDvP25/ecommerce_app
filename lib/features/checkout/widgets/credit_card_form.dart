import 'package:ecommerce/features/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:ecommerce/core/theme/colors.dart';

class CreditCardeForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CreditCardeForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return CreditCardForm(
          inputConfiguration: InputConfiguration(
            cardNumberDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Card Number',
              hintText: 'XXXX XXXX XXXX XXXX',
              labelStyle: TextStyle(
                color: AppColors2.black,
                fontWeight: FontWeight.bold,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            expiryDateDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,

              labelText: 'Expiry Date',
              hintText: 'MM/YY',
              labelStyle: TextStyle(
                color: AppColors2.black,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            cvvCodeDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,

              labelText: 'CVV',
              hintText: 'XXX',
              labelStyle: TextStyle(
                color: AppColors2.black,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            cardHolderDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Card Holder',
              hintText: 'Yassine El Anssari',
              labelStyle: TextStyle(
                color: AppColors2.black,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            cardNumberTextStyle: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 16,
            ),
            expiryDateTextStyle: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 14,
            ),
          ),

          cardNumber: state.cardNumber,
          cardHolderName: state.cardHolderName,
          cvvCode: state.cvvCode,
          expiryDate: state.expiryDate,

          onCreditCardModelChange: (CreditCardModel data) {
            context.read<CheckoutCubit>().onCreditCardModelChange(data);
          },
          formKey: formKey,
        );
      },
    );
  }
}
