// import 'package:http/http.dart' as http;
//
// import '../model/adventure_tickets_model.dart';
// import '../utils/constants.dart';
//
// class AdTicketController {
//   static Future<List<AdTicket>> get() async {
//     List<AdTicket> tickets = [];
//
//     var url = Uri.parse('$baseUrl/public/api/adventure_tickets');
//     print(url);
//     var response = await http.get(
//       url,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json'
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return adTicketFromJson(response.body);
//     } else {
//       print(response.body);
//     }
//
//     return tickets;
//   }
// }
