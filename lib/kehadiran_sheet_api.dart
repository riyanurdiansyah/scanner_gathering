import 'package:coba_coba/kehadiran.dart';
import 'package:gsheets/gsheets.dart';

class KehadiranSheetApi {
  static const _credentials = {
    "type": "service_account",
    "project_id": "sike-374307",
    "private_key_id": "11efd6f99f52b006d211cefc2041c01fa5a83e92",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCySv72orYDYUHp\nQr/gZRo826Gme1dJVZ4KuTNQOUcUIShvUMHx6J3x8o9N35R7AxTJayMkc4Zwo9iN\njxSbt7OY2gJ/Nu1RqD6ooItziwmnMvWFftm39xs0u6MGwp6MNx+SH+ma9A6cEmOZ\nTSuke0fMUl4oCUJCaliIt4QbcDrEpWzB2Lkb2J0oshRddSn2wLEJnDMjDZEepMWD\nt0nXT8IY41QJds566XGqyWLBc+3gLs8yDBljFd3BMwReOoqfj4thDf0UY7hnkwD9\n+uHNCo3vL7UBQBMfoj9tnVNM8eHzSdSaDKQi4fAqxU9afMd1CU7EHsloF4SiPl9s\nzTM/ZmhnAgMBAAECggEABzTi02NGSiKvQFdzXAWaJuWVxh3sLEmqprJPsalvBxBE\nCyPPgxCs+a+dPT+RR9ubBn0vIXUN9RWaVjZ3Vcf6GW6OdUfqFcfgKH68xEHVdQ2p\nQOkcscPqNJp0/3v0XqSHwSdLEPlWcdaIchTdc7uL7mVR6vpc1ERqKbSJQXaq2XHp\nCVtmeLasMx5LOW+jwQdEFESGpU7lgWBNECjFkZ3nT+LIbX/hEgqyANZ9PDBUZVkx\nyfbqqkagZs9eeOnCrBhkX4ziXMy5ENUo9tbyxBZyowfY/YLFJjY+wBMCptojejs3\nBXgYDgbegtQgUh3MHnCUZPcJ8F+gun6r6cf2hmpsMQKBgQDbsIjHccJ7YBNjR1RQ\nQWg6dQoWp4pwBY115BxgErwNQy9bMgFhpv6xlJ1r3AYyl9Uw4Zlf7NtpRt6rCZuE\nkmaEpr1F4+7TqfxLzno0vwdzjTkT6Y3TRP/xl/jD/M2HWJPWwP0ZuosE9iZTMo1X\nKLaQFt6nGRaqIMfvbzVxPxl0TwKBgQDPwuUTkvm6ZhiFn9qTGLCWtcGqqALPHuh+\npIy7usVKKg+OgpQywTEA4XSIweg3A2N2Yu9UW4cGdYUHQXbDxSg1N6H/mnZz6GDm\nFebEJfVPZFUkMuAW+hnBSeyVUWsozIKmtXxnUMRDd6C1x0idZ/3QZ+roF2FjJKY8\nJc6esN4MaQKBgQDYAklLCdD3LG2DxWPikZ1hNSlZQx08rkj8bPF1iZY72B6dJZr0\nIJX3l6/9mNbDMkVeDcSX7DWE2zkfpY+zl5uTvLsIGGkA1/gJtZi1ektiU66WpKNd\n409hhlMEqfKQrQiYNSPoA2Kj2z+tuFv/Ijn3jXUZifKeDyNnispacnedwwKBgCly\nReS7w1nuGCJAG4iQulm2dKYo0jajgdoR1Yl13vnGnkfdwNbHN5FnaKoHlN20rVjm\nr7vybmNZempSIvE3GahUKtsk41CIIRyFbf3fXKqz51BLXez3g7/NkYbQMUJ4WfAL\n8H9j22NiMAtTcCcGodm7gV8/msv+ebMyD6AUxJdRAoGAdKdnfbGodJGlJ9tDWAR8\nRABfXvKgrHvo5K1ifj73sEImi3ERLqi0kSbzQvU2tkoY2BO6SKaLsE+he8l6QY7N\n0KDFEPfxYxI7J3C92xyXjgmZfKMiOl7/SOWQv1HFEaNbog4eIBShIX1GwhS9zFDf\nki/QHA2eYjAg5XdgJuO1m0k=\n-----END PRIVATE KEY-----\n",
    "client_email": "gsheets@sike-374307.iam.gserviceaccount.com",
    "client_id": "108201303535707372351",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40sike-374307.iam.gserviceaccount.com"
  };
  static const _id = "1xflw08RK_pZ3ZpGlrJxtLFRXk1ORo38eCMrEFBnecoI";

  static final _gsheet = GSheets(_credentials);
  static Worksheet? _kehadiranSheet;

  static Future init() async {
    final spredsheet = await _gsheet.spreadsheet(_id);
    _kehadiranSheet = await _getWorkSheet(spredsheet, "Kehadiran");
  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, String title) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(Kehadiran user) async {
    if (_kehadiranSheet == null) return;

    _kehadiranSheet!.values.map.appendRow(user.toJson());
  }

  static Future<List<Kehadiran>> getAll() async {
    List<Kehadiran> listKehadiran = [];
    if (_kehadiranSheet == null) return [];

    final res = await _kehadiranSheet!.values.map.allRows();
    for (var data in res ?? []) {
      listKehadiran.add(Kehadiran.fromJson(data));
    }
    return listKehadiran;
  }
}
