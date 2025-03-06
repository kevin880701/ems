class AccountData {
  final String token;
  final String account;
  final String name;
  String? org;
  final int accountType;
  final String password;
  String? eUid;
  String? gUid;
  String? aUid;

  AccountData({
    required this.token,
    required this.account,
    required this.name,
    this.org,
    required this.accountType,
    required this.password,
    this.eUid,
    this.gUid,
    this.aUid,
  });

  factory AccountData.clear() {
    return AccountData(
      token: "",
      account: "",
      name: "",
      org: "",
      accountType: 0,
      password: "",
      eUid: null,
      gUid: null,
      aUid: null,
    );
  }
}
