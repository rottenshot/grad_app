import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_app/components/default_button.dart';
import 'package:grad_app/doctor/layout/bloc/doctor_layout_cubit.dart';
import 'package:grad_app/doctor/layout/bloc/doctor_states.dart';
import 'package:grad_app/resources/app_colors.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MriImagePicker extends StatelessWidget {
  const MriImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, DoctorStates>(
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.kDoctorPrimaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.kDoctorPrimaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text(
                  'Hello doc, Please pick MRI image.',
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.white, fontSize: 19),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  text: 'Attach Image',
                  color: AppColors.kDoctorSecondaryColor,
                  iconData: Icons.attach_file,
                  function: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15)),
                              color: AppColors.kDoctorSecondaryColor,
                            ),
                            height: MediaQuery.of(context).size.height * .22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        border: GradientBoxBorder(
                                          gradient: LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.red,
                                            Colors.blue,
                                            Colors.red,
                                          ]),
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      height: 65,
                                      width: 65,
                                      child: IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          cubit.takeRmiPhoto();
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Camera',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        border: GradientBoxBorder(
                                          gradient: LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.red,
                                            Colors.blue,
                                            Colors.red,
                                          ]),
                                          width: 2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      height: 65,
                                      width: 65,
                                      child: IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          cubit.getRmiPhoto();
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.image,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Gallery',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                cubit.image != null
                    ? Container(
                        padding: const EdgeInsets.all(4.6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: AppColors.kDoctorSecondaryColor)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            cubit.image!,
                            scale: 1.5,
                            height: MediaQuery.of(context).size.height * .38,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
