import 'package:get/get.dart';

class DetailCotroller extends GetxController{
  DetailCotroller(this.id);
  final int id;
  bool loading = false;

  void oninit(){
    super.onInit();
   // fetchInternDetail(id);
  }
  //bool loading = false;

  // fetchInternDetails(int id) asyc{
  //   var respose = await RemoteService().fetchInternDetail(id);
        //log(response.data.toString));
  // }
 // fetchDetail(int id);
}