import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
  {
  "type": "service_account",  
  "project_id": "fintrack-348523",
  "private_key_id": "edbbcbbf368c6de3e11083244b2496a7cd34b53b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDIuTSK9RCUB6B/\nG6ZTuduAFl8QH6U6AjzU4YbgL6TNIey//4tTKvwfKZN7KmtYLZbbAmXOX9emSNRB\n+Do5d5oXjlQjgBXoCysnR/FajRyRbJLEVhUbNX+XYY5bDDbJ/Rqh/dhn8749hFwC\nmVqtgmO4GpIbGZCSIt1vclHUCcpBZfKw3cREsUXk4znIczl93AyB16yAiHSGGVZH\nJZHC/mo3OtN848kqzKNUt2s1DDVYU6EmJbMgSm4OdxLcR0Tl76+hEtzV8Eq+rs43\n3ROL/iujE9R066M6Hg2EhkxJk0ymVde1b+/HnUuK4zQlH24YzB6NTQV0gLvARD61\nZXyJNeSRAgMBAAECggEAM5fzawJZ7ArX1MQ5KQ09X/ugHMddk38OvtNndUmZzUZ6\nkdFwMQT8AFCSAZciN2ykeY/wti7Jggr3UCurX6kf+Q0TEHr0Zow0X+jsn09lN/YV\n9ZSA4VkLflBLpJiLnrjJtzjF/tZWoH5cnihn9/BrjF98Da4xDHccvvA+G0gW7l7/\nCyMIivOpqAE6ZjLCqI8HKM+oTTFVNVSei6TAn5racsmSvtsbZNjLVwdt0TZa5WWV\nQTIsJ1S+ScKwic3UfXQisOaV1//cLwFRugP5nf9PMfT+rdAlz5BMV/Y8stduV1ss\nx05ILACktdBUErOeDKJPPWqHzGs5JrCmccEjtr35ZwKBgQDljaWPNfk6WbfLsKAF\n6SG53FBbhLNc1wScQoR0qmbWk+Pz1zdrKw6Rn1j5EaDLHcsocGdmgDbRI86MvfC9\n1rjS5AtRnHyOayp/mV3iqHJ68OVD4mlQViL90HY/xEStkfmX8zRhpztIfuPizZRy\n8klNa2B3eOkDpZ4xqx7UzQ0oXwKBgQDf2UMzExPLgkA0qjrYxkB2f6U44jdGGbhx\n80E1lo1g9jNIKki1oA9HXStfDIHxWS+FhEdHeTZGfdk7rxskHY7tIqWt8Mb5XeVz\nM17ddUUsavdWRa0OQgpdtoAljIQek9T+iKSW0ooTTPax+KKX4VYxariKMxOK8KuM\n2QtTrMjZDwKBgF+A2PqGGBSgswj5iPosji2HbZ9FzGG5y18/hWAMbRClIteWGKZr\nmXoYc6ncHaujz5wZd8t7WFMWtJ51f61bojWLTvI7Ss7t4xaHNjpQnqBrjNb7YZlc\n3N4AVtIc0/3ql48STh66tr1onWME6NgR2VFudQn/seIki3ZanU8nqGu9AoGAcY1H\n3nfV+c1X/p8//MkM2E/GI4X1nhTcEMniEWoOy9n4h6oTejb4qS3lG3E/1Yt1ZNiG\nRAaD9txOP02Dih2IbFjADO1wMf1ksLyladfcQDz+vP/ZWrs7gPBcLzAJsW0yhfAQ\n9gVVT5ciKYPEDyGa1LSbalegmUGe9HMBoO+sbxcCgYEAjujMwfacW8D8SBj7QbrC\n1kXVgAU4b6FLSHae0K3oyRxrxrT2aVit6fGTgH6Fsf6KumN7I7HzSfQl2UOTpPYS\nO1kwzESk2r3MMzrfJZK77AKmVb96C94i6FWYfzsRmejbJWMGSytH/WM6GnILj1Ni\ncimwSEVQHnQLvjyBbyCoSCY=\n-----END PRIVATE KEY-----\n",
  "client_email": "fintrack-account@fintrack-348523.iam.gserviceaccount.com",
  "client_id": "117263809524899522058",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fintrack-account%40fintrack-348523.iam.gserviceaccount.com"  
  }
  ''';

  // set up & connect to the spreadsheet
  static final _spreadsheetId = '1Fg3T97UxTY3z4LMYf5xfT7dPbAUSlkojEqtPfS80fPc';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // some variables to keep track of..
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialise the spreadsheet!
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Sheet1s');
    countRows();
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }

  // insert a new transaction
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }

  // CALCULATE THE TOTAL INCOME!
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  // CALCULATE THE TOTAL EXPENSE!
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
