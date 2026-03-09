part of 'checkout_cubit.dart';

/// State model for checkout feature
class CheckoutState extends Equatable {
  /// Product quantity in cart
  final int quantityCounter;

  /// Total price calculation (quantity × unit price)
  final int totalPrice;

  /// Selected quantity counter
  final int selectedCounter;

  /// Credit card number
  final String cardNumber;

  /// Card expiry date (MM/YY format)
  final String expiryDate;

  /// Card holder name
  final String cardHolderName;

  /// CVV security code
  final String cvvCode;

  /// Flag to show card back view when CVV is focused
  final bool showBackView;

  /// Constructor with all required parameters
  const CheckoutState(
    this.quantityCounter,
    this.totalPrice,
    this.selectedCounter,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    this.showBackView,
  );

  /// Create a copy of this state with optional new values
  CheckoutState copyWith({
    int? quantityCounter,
    int? totalPrice,
    int? selectedCounter,
    String? cardNumber,
    String? expiryDate,
    String? cardHolderName,
    String? cvvCode,
    bool? showBackView,
  }) {
    return CheckoutState(
      quantityCounter ?? this.quantityCounter,
      totalPrice ?? this.totalPrice,
      selectedCounter ?? this.selectedCounter,
      cardNumber ?? this.cardNumber,
      expiryDate ?? this.expiryDate,
      cardHolderName ?? this.cardHolderName,
      cvvCode ?? this.cvvCode,
      showBackView ?? this.showBackView,
    );
  }

  @override
  List<Object?> get props => [
    quantityCounter,
    totalPrice,
    selectedCounter,
    cardNumber,
    expiryDate,
    cardHolderName,
    cvvCode,
    showBackView,
  ];
}