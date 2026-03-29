import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

part 'checkout_state.dart';

/// Cubit for managing checkout and payment process
class CheckoutCubit extends Cubit<CheckoutState> {
  /// Initialize CheckoutCubit with default state
  CheckoutCubit() : super(CheckoutState(1, 0, 1, '', '', '', '', false));

  /// Increment quantity counter and update total price
  ///
  /// Parameters:
  ///   - price: Unit price of the product
  void quantityCounterIncrement(int price) {
    emit(
      state.copyWith(
        quantityCounter: state.quantityCounter + 1,
        totalPrice: price * (state.quantityCounter + 1),
        selectedCounter: state.quantityCounter,
      ),
    );
  }

  /// Decrement quantity counter and update total price
  ///
  /// Parameters:
  ///   - price: Unit price of the product
  /// Note: Quantity cannot go below 1
  void quantityCounterDecrement(int price) {
    if (state.quantityCounter != 1) {
      emit(
        state.copyWith(
          quantityCounter: state.quantityCounter - 1,
          totalPrice: price * (state.quantityCounter - 1),
          selectedCounter: state.quantityCounter,
        ),
      );
    }
  }

  /// Update credit card information when user enters card details
  ///
  /// Parameters:
  ///   - data: CreditCardModel containing card information and validation state
  void onCreditCardModelChange(CreditCardModel data) {
    emit(
      state.copyWith(
        cardNumber: data.cardNumber,
        expiryDate: data.expiryDate,
        cardHolderName: data.cardHolderName,
        cvvCode: data.cvvCode,
        showBackView: data.isCvvFocused,
      ),
    );
  }
}
