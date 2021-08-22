import 'package:flutter/material.dart';
import 'package:news_flutter/ui/SideMenu.dart';

class CategoriesPage extends StatelessWidget {
  static const String Route_Name ='Categories';
  static final List<CategoryParameters> inGridCategories =[
    new CategoryParameters(Color(0xFFC91C22), 'assets/sports.png', "Sports", true),
    new CategoryParameters(Color(0xFF003E90), 'assets/Politics.png', "Politics", false),
    new CategoryParameters(Color(0xFFED1E79), 'assets/health.png', "Health", true),
    new CategoryParameters(Color(0xFFCF7E48), 'assets/bussines.png', "Business", false),
    new CategoryParameters(Color(0xFF4882CF), 'assets/environment.png', "Environment", true),
    new CategoryParameters(Color(0xFFF2D352), 'assets/science.png', "Science", false),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: new Text('News App', style: TextStyle(color: Colors.white, fontSize: 22),),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28),
          )
        ),
    ),
    drawer: Drawer(
      child: AppSideMenu(),
    ),
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bckImg.png"), fit: BoxFit.fill,),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            margin: EdgeInsets.fromLTRB(29, 42, 0, 0),
            child: new Text(
            'Pick your category \nof interest',
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
  String imageUrl, categoryTitle;
  bool left;

  CategoryParameters(this.backgroundColor, this.imageUrl, this.categoryTitle, this.left);
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
      child: FlatButton(
          onPressed: (){
            ///to get the category = myParams.categoryTitle
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
