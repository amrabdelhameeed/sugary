import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class SliderCustom extends StatelessWidget {
  const SliderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Slider(
        value: HomeCubit.get(context).status,
        min: 70,
        max: 550,
        activeColor: Colors.pink,
        onChanged:(value){
          HomeCubit.get(context).ChangeStatus(value);
          print(value);
        }
    );
  }
}
