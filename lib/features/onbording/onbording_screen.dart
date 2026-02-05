import 'package:flutter/material.dart';
 
import 'package:news_app/features/onbording/controller/onbording_controller.dart';
import 'package:news_app/features/onbording/models/onbording_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnbordingController(),
      builder: (context, child) {
        final controller = context.read<OnbordingController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF5F5F5),
            actions: [
              Consumer<OnbordingController>(
                builder: (context, controller, child) {
                  return 
                  
                  
                  controller.isLastPage
                      ? SizedBox.shrink()
                      : TextButton(
                          onPressed: () {
                      controller.onFinish(context);

                           },
                          child: Text("Skip", style: TextStyle(fontSize: 16)),
                        );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              children: [
                Expanded(
                 
                  child: PageView.builder(
                    itemCount: OnbordingModel.onbordingList.length,
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      Provider.of<OnbordingController>(
                        context,
                        listen: false,
                      ).onPageChanged(index);
                    },
                    itemBuilder: (context, index) {
                      final OnbordingModel model =
                          OnbordingModel.onbordingList[index];
                      return Column(
                        children: [
                          Image.asset(model.image),
                          SizedBox(height: 24),
                          Text(
                            model.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4e4b66),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            model.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff6e7191),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Consumer<OnbordingController>(
                  builder: (context, controller, child) {
                    return SmoothPageIndicator(
                      controller: controller.pageController,
                      count: OnbordingModel.onbordingList.length,
                      effect: SwapEffect(
                        dotColor: Color(0xffD3D3D3),
                        activeDotColor: Color(0xffc53030),
                      ),
                    );
               
                  },
                ),

                SizedBox(height: 112),
                ElevatedButton(
                  onPressed: () {
                    if(controller.isLastPage){
                      controller.onFinish(context);
                     }
                    controller.nextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 52),
                  ),
                  child: Consumer<OnbordingController>(
                    builder: (context, controller, child) {
                      return Text(
                        controller.isLastPage ? "Get Started" : "Next",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
