import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70 * context.sc,
        backgroundColor: BaseColors.secondary,
        centerTitle: true,
        title: const Text('Edit Profile'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0) * context.sc,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25 * context.sc,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12) * context.sc,
            child: IconButton(
              icon: Icon(
                Icons.check,
                size: 25 * context.sc,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10 * context.sc,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 43 * context.sc,
                  backgroundImage: const NetworkImage(
                      'https://www.kino-teatr.ru/news/13163/125677.jpg'),
                  child: const Icon(
                    Icons.photo_camera_outlined,
                    size: 23,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ryan',
                              hintStyle: TextStyle(fontSize: 13, color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.8,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Gosling',
                              hintStyle: TextStyle(fontSize: 13, color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.8,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9 * context.sc,
            ),
            const Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 1 * context.sc,
            ),
            const SizedBox(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '@konst_konstantin',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 0.8,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 0.8,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5 * context.sc,
            ),
            const Text(
              'You can choose a username for your profile. If you do, people will be able to find you by this username and contact you without any additional information.',
              style: TextStyle(
                  color: Color.fromARGB(125, 255, 255, 255), fontSize: 12),
            ),
            SizedBox(
              height: 17 * context.sc,
            ),
            const Text(
              'Bio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 1 * context.sc,
            ),
            const SizedBox(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      'Hi every one, have a nice day! Hi every one, have a nice day! Hi every one, have a nice day!',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0.8,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0.8,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5 * context.sc,
            ),
            const Text(
              'You can add a few lines about yourself. Anyone who opens your profile will see this text..',
              style: TextStyle(
                  color: Color.fromARGB(125, 255, 255, 255), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
