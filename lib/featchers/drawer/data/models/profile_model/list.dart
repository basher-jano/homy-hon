import 'account.dart';
import 'user.dart';

class List {
  Account? account;
  User? user;
  dynamic image;
  int? dayLeftToEndSubscription;

  List({
    this.account,
    this.user,
    this.image,
    this.dayLeftToEndSubscription,
  });

  factory List.fromJson(Map<String, dynamic> json) => List(
        account: json['account'] == null
            ? null
            : Account.fromJson(json['account'] as Map<String, dynamic>),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        image: json['image'] as dynamic,
        dayLeftToEndSubscription: json['day left to end Subscription'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'account': account?.toJson(),
        'user': user?.toJson(),
        'image': image,
        'day left to end Subscription': dayLeftToEndSubscription,
      };
}
