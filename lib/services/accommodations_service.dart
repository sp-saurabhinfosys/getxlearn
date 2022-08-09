

import 'package:get/get.dart';

import 'package:getxlearn/models/my_list_model.dart';
class ListOpService extends GetxController{

  RxList<MyListModel> listData = <MyListModel>[].obs;
  int selectedListIndex = -1.obs;
  // RxList<Accommodation>? accList = <Accommodation>[].obs;

  changeSelectedIndex(int x)
  {
    selectedListIndex = x ;
    update();
  }


  addDataToList(MyListModel d)
  {
    listData.add(d);
    update();
  }
  updateListValue(MyListModel d, int i)
  {
    listData[i] =d;
    update();
  }
  removeFromList( int i)
  {
    listData.removeAt(i);
    update();
  }
  // Future<List<Accommodation>>? getAccommodation( String country)
  // async {
  //   log("getAccommodation");
  //   List<Accommodation>  a= [];
  //   String  url= "${EndpointUrl.getAccommodationUrl}/$country";
  //
  //   http.Response? response = await ApiCall.getRequest(url);
  //   if(response !=null) {
  //     apiResponseStatus(response.statusCode);
  //     if(response.statusCode == 200)
  //       {
  //         isLoading(true);
  //         var parsedData = jsonDecode(response.body);
  //         a= (parsedData['results'] as List).map((e) => Accommodation.fromJson(e)).toList();
  //         accList!.addAll(a);
  //         log(accList.toString());
  //         isLoading(false);
  //         update();
  //       }
  //   }
  //   return a;
  // }


}