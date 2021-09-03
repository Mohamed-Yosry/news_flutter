import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoriesPage extends StatelessWidget {
  final Function(String,String) changeCurruntCategoty;
  CategoriesPage(this.changeCurruntCategoty);


  static const String Route_Name ='Categories';


  @override
  Widget build(BuildContext context) {

    final List<CategoryParameters> inGridCategories =[
      new CategoryParameters(Color(0xFFC91C22), 'assets/sports.png', AppLocalizations.of(context)!.sports, true,"sports",changeCurruntCategoty),
      new CategoryParameters(Color(0xFF003E90), 'assets/Politics.png', AppLocalizations.of(context)!.politics, false,"politics",changeCurruntCategoty),
      new CategoryParameters(Color(0xFFED1E79), 'assets/health.png', AppLocalizations.of(context)!.health, true,"health",changeCurruntCategoty),
      new CategoryParameters(Color(0xFFCF7E48), 'assets/bussines.png', AppLocalizations.of(context)!.business, false,"bussines",changeCurruntCategoty),
      new CategoryParameters(Color(0xFF4882CF), 'assets/environment.png', AppLocalizations.of(context)!.environment, true,"environment",changeCurruntCategoty),
      new CategoryParameters(Color(0xFFF2D352), 'assets/science.png', AppLocalizations.of(context)!.science, false,"science",changeCurruntCategoty),
    ];

    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bckImg.png"), fit: BoxFit.fill,),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  margin: EdgeInsets.fromLTRB(29, 42, 29, 0),
                  child: new Text(
                    AppLocalizations.of(context)!.categoriesText,
                    style: TextStyle(color: Color(0xFF4F5A69), fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: GridView
                      (
                      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 37),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:20,
                        crossAxisSpacing: 25,
                        childAspectRatio: 0.8,
                      ),
                      children: inGridCategories.map((e) =>CategoryItem(e)).toList(),
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}

class CategoryParameters
{
  Color backgroundColor;
  String imageUrl, categoryTitle,categoryEnglishTitle;
  bool left;
  final Function(String,String) changeCurruntCategoty;


  CategoryParameters(this.backgroundColor, this.imageUrl, this.categoryTitle, this.left,this.categoryEnglishTitle,this.changeCurruntCategoty);
}

class CategoryItem extends StatelessWidget
{
  final CategoryParameters myParams;
  CategoryItem(this.myParams);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: myParams.left? BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
            :BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: myParams.backgroundColor,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: (){
          myParams.changeCurruntCategoty(myParams.categoryTitle,myParams.categoryEnglishTitle);
          //Navigator.pushNamed(context, HomeScreen.Route_Name,arguments: [myParams.categoryEnglishTitle, myParams.categoryTitle]);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: myParams.imageUrl=="assets/science.png"? EdgeInsets.only(bottom: 21)
                    :EdgeInsets.only(bottom: 3),
                child: Image(
                  image: AssetImage(myParams.imageUrl),
                ),
              ),
              Text(
                myParams.categoryTitle,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

            ],
          ),
        ),
      ),
    );
  }

}