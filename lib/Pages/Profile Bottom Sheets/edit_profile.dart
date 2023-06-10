import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_reserve/Controllers/profile_controller.dart';

enum OnReserveTheme { light, dark, system }

class EditProfileBottomSheet extends StatelessWidget {
  const EditProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final profileController = Get.find<ProfileController>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        'Edit Profile',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close_outlined)),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 45,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 45,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 45,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 45,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Bio',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Logo Upload
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                profileController.getImage();
                              },
                              child: Container(
                                height: 90,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: profileController.profilePic == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_a_photo,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          SizedBox(height: 8),
                                          Text(
                                            "Profile Image",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          )
                                        ],
                                      )
                                    : Image.file(
                                        profileController.profilePic!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                profileController.getImage();
                              },
                              child: Container(
                                height: 90,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: profileController.coverPic == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_a_photo,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          SizedBox(height: 8),
                                          Text(
                                            "Cover Image",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          )
                                        ],
                                      )
                                    : Image.file(
                                        profileController.coverPic!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Edit Profile'),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
