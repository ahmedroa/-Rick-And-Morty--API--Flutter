import 'package:aname/Models/characters.dart';
import 'package:aname/constants/my_colors.dart';
import 'package:aname/screen/Home.dart';
import 'package:aname/screen/characters_details_screen.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    super.key,
    required this.characters,
    required this.widget,
  });

  final List<Character> characters;
  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: characters.length,
        itemBuilder: (ctx, index) {
          return GridTile(
            footer: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: Text(
                  characters[index].name,
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: MyColors.myWhite,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Hero(
              tag: characters[index].id,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            widget,
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: CharacterDetailsScreen(
                              character: characters[index],
                            ),
                          );
                        },
                      ));
                },
                child: Container(
                  color: MyColors.myGrey,
                  child: characters[index].image.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: 'assets/loading.gif',
                          image: characters[index].image,
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/no_internet.jpg'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
