import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/constants/app_colors.dart';
import 'package:sugar/core/constants/app_lists.dart';
import 'package:sugar/core/constants/app_routes.dart';
import 'package:sugar/core/models/question_model.dart';
import 'package:sugar/features/questions/logic/ques_cubit.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<QuestionModel> questions;
  late CarouselController carouselController;
  int currentPage = 0;
  bool isLoading = false;
  @override
  void initState() {
    questions = AppLists.questions;
    carouselController = CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkcolor,
      appBar: AppBar(
        backgroundColor: AppColors.pinkcolor,
        actions: [
          isLoading
              ? const CircularProgressIndicator.adaptive()
              : IconButton(
                  onPressed: () {
                    if (currentPage == questions.length - 1) {
                      setState(() {
                        isLoading = true;
                      });
                      FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({'questions': questions.toFirestoreList()}).then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      context.pushReplacementNamed(AppRoutes.personDetails);
                      ;
                    } else if (questions[currentPage].correctAnswer.isNotEmpty) {
                      setState(() {
                        currentPage++;
                        if (kDebugMode) {
                          print("Current page +$currentPage");
                        }
                      });
                      carouselController.nextPage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter your choice")));
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 30.sp,
                    color: Colors.black,
                  ),
                ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          // Display all questions
          CarouselSlider.builder(
              carouselController: carouselController,
              disableGesture: true,
              itemCount: questions.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: EdgeInsets.all(5.h),
                  child: _buildQuestionCard(
                    questions[index],
                  ),
                );
              },
              options: CarouselOptions(
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  aspectRatio: 0.9,
                  disableCenter: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1))
        ],
      ),
    );
  }

  Widget _buildQuestionCard(QuestionModel question) {
    return Center(
      child: BlocBuilder<QuesCubit, QuesState>(
        builder: (context, state) {
          var quescubit = QuesCubit.get(context);
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              // height: 300.h, // Adjust the height as needed
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    // Display question text
                    Text(
                      question.question,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Display answer options
                    for (var answer in question.answers)
                      ElevatedButton(
                        onPressed: () {
                          // Capture the selected answer
                          questions[currentPage].correctAnswer = answer;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          side: const BorderSide(color: Colors.black, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          fixedSize: const Size(320, 60),
                          backgroundColor: questions[currentPage].correctAnswer == answer ? Colors.green : Colors.white,
                        ),
                        child: Text(
                          answer,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
