import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppsPage extends StatelessWidget {
const AppsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        child: Text("AppsPage", style: TextStyle(fontSize: 30.sp),),
      ),
    );
  }
}