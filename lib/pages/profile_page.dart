import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        child: Text("ProfilePage", style: TextStyle(fontSize: 30.sp),),
      ),
    );
  }
}