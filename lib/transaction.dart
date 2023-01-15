class Transaction {
  final String id;
  final String title;
  final double amount;
  final String note;
  final DateTime date;

  Transaction(this.id, this.title, this.amount, this.date, this.note);
}