import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownButtonWidget extends StatelessWidget {
  final String text;
  final String hinttext;
  final List<dynamic> items;
  final void Function(dynamic) callback;
  final dynamic value;



  const DropDownButtonWidget(
      {Key key,
      this.hinttext,
      this.items,
      this.callback,
      this.value,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 7.h),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: 50.h,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.w),
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: DropdownButton(
            value: value,
            isExpanded: true,
            hint: Text(
              hinttext,
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged: callback,
          ),
        ),
      ],
    ));
  }
}
