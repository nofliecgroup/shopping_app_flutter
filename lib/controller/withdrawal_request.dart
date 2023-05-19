class WithdrawalRequest  {

final DateTime date;
  final String name;
  final String email;
  final String phone;
  final double amount;
  final String bankName;
  final String accountNumber;
  String status;

  WithdrawalRequest({
    required this.date,
    required this.name,
    required this.email,
    required this.phone,
    required this.amount,
    required this.bankName,
    required this.accountNumber,
    required this.status,
  });
  
  List<WithdrawalRequest> withdrawalRequests = [
  WithdrawalRequest(
    date: DateTime(2023, 5, 15),
    name: 'John Doe',
    email: 'johndoe@example.com',
    phone: '1234567890',
    amount: 500.0,
    bankName: 'ABC Bank',
    accountNumber: '1234567890',
    status: 'Approved',
  ),
  WithdrawalRequest(
    date: DateTime(2023, 5, 16),
    name: 'Jane Smith',
    email: 'janesmith@example.com',
    phone: '9876543210',
    amount: 750.0,
    bankName: 'XYZ Bank',
    accountNumber: '0987654321',
    status: 'Rejected',
  ),

WithdrawalRequest(
    date: DateTime(2023, 5, 17),
    name: 'John Doe',
    email: 'info@nofliegroup.com',
    phone: '1234567890',
    amount: 500.0,
    bankName: 'ABC Bank',
    accountNumber: '1234567890',
    status: 'Approved',
  ),

WithdrawalRequest(
    date: DateTime(2023, 5, 18),
    name: 'Jane Smith',
    email: 'janesmith@nofliegroup.com',
    phone: '9876543210',
    amount: 750.0,
    bankName: 'XYZ Bank',
    accountNumber: '0987654321',
    status: 'Rejected',
  ),

WithdrawalRequest(
    date: DateTime(2023, 5, 19),
    name: 'John Doe',
    email: 'info@nofliegroup.com',
    phone: '1234567890',
    amount: 500.0,
    bankName: 'ABC Bank',
    accountNumber: '1234567890',
    status: 'Approved',
  ),



];

}