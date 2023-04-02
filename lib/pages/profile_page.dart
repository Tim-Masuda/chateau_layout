import 'package:chateau_mobile_homescreen/scale.dart';
import 'package:chateau_mobile_homescreen/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: Column(
        children: [
          const SliderImage(),
          SizedBox(
            height: 18 * context.sc,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(125, 255, 255, 255),
                  ),
                ),
                SizedBox(
                  height: 8 * context.sc,
                ),
                const Text(
                  'Someday, I will stop being a replicant and end my life as a real person.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 18 * context.sc,
                ),
                const Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(125, 255, 255, 255),
                  ),
                ),
                SizedBox(
                  height: 8 * context.sc,
                ),
                const Text(
                  '@Ryt5454',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SliderImage extends StatefulWidget {
  const SliderImage({Key? key}) : super(key: key);
  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  final PageController _imageViewController = PageController(initialPage: 0);

  int _activeImage = 0;

  final List _images = [
    const Image(
      width: double.infinity,
      fit: BoxFit.fill,
      image: NetworkImage(
          'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg'),
    ),
    const Image(
      width: double.infinity,
      fit: BoxFit.fill,
      image: NetworkImage(
          'https://images.wallpapershq.com/wallpapers/1284/wallpaper_1284_1920x1080.jpg'),
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    _imageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260 * context.sc,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            controller: _imageViewController,
            onPageChanged: (int index) {
              setState(() {
                _activeImage = index;
              });
            },
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return _images[index];
            },
          ),
          const Positioned(
            bottom: 0,
            left: 9,
            right: 0,
            height: 60,
            child: Text(
              'Online',
              style: TextStyle(fontSize: 12, color: BaseColors.pink),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 9,
            right: 0,
            height: 40,
            child: Text(
              'Samat High',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            right: 5,
            height: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _images.length,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        _imageViewController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _activeImage == index
                              ? Colors.white
                              :const  Color.fromARGB(122, 255, 255, 255),
                        ),
                        height: 2 * context.sc,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
