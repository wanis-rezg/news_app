import 'package:flutter/material.dart';
  import 'package:news_app/features/home/controller/home_controller.dart';
 import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

 
 
 
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
        return Scaffold(
           body:
           controller.errorMessge?.isNotEmpty??false ? Center(child: Text(controller.errorMessge!),) 
           : 
           controller.everyThingisLoading ? Center(child: CircularProgressIndicator(),) 
           : 
           Column(
            children: [
             Stack(
              
               children: [
        
                Image.asset('assets/images/images 2.png'),
                Positioned(
                     top: 70,
                     left:170,
                  child: 
                Text("NEWST",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xFFC53030)),),
                 ), 
                         Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                      Text("Your Daily News",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xFFC53030)),),
                       TextButton(onPressed: (){}, child: Text("See More"))
                                   ],
                                  ),
               
                   
               
                //  Expanded(
                //    child: ListView.builder(
                //     itemCount: controller.newsTopHeadLineList.length,
                //     itemBuilder: (context, index) {
                //       return Text(controller.newsTopHeadLineList[index].title);
                //     },
                //                ),
                //  ),
               
             
           ],)
            ]
           ) 
        );
      },
      ),
    );
  }
}