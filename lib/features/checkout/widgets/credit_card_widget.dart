import 'package:ecommerce/features/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:ecommerce/core/theme/colors.dart';

class CreditCardeWidget extends StatelessWidget {
  final void Function(CreditCardBrand) onCreditCardWidgetChange;
  const CreditCardeWidget({super.key, required this.onCreditCardWidgetChange});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return CreditCardWidget(
          padding: 6,
          height: 210,
          width: 410,
          backgroundImage:
              'assets/images/ChatGPT Image Mar 9, 2026, 11_29_29 AM.png',

          enableFloatingCard: true,
          cardNumber: state.cardNumber,
          expiryDate: state.expiryDate,
          cardHolderName: state.cardHolderName,
          cvvCode: state.cvvCode,
          showBackView: state.showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: onCreditCardWidgetChange,

          cardBgColor: AppColors2.black,
        );
      },
    );
  }
}
