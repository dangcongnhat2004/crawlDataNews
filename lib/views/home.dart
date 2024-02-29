import 'package:cached_network_image/cached_network_image.dart';
import 'package:crawldata/helper/data.dart';
import 'package:crawldata/helper/news.dart';
import 'package:crawldata/model/article_model.dart';
import 'package:crawldata/model/categori_model.dart';
import 'package:crawldata/views/article_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<ArticleModel> articales=[];

  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articales=newsClass.news;
    setState(() {
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
       body:_loading?
       Center(child: Container( child: CircularProgressIndicator(),
       )):

        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
          
          child: Column(
            children: <Widget>[
              //Categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              //Blogs
              Container(
                padding: EdgeInsets.only(top: 16),
                   child: ListView.builder(
                    itemCount: articales.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return BlogTile(
                        imageUrl: articales[index].urlToImage,
                       title: articales[index].title, 
                       desc: articales[index].description,
                       url: articales[index].url,
                       );
                    }),
              )
            ],
          ),
                ),
        ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
         margin: EdgeInsets.only(right: 16),
        child: Stack(
      
          children:<Widget>
           [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(6),
              child:  CachedNetworkImage(
              imageUrl:imageUrl,
              width: 120,
              height: 60,
              fit: BoxFit.cover, 
              
            ),
            ),
           
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              
                child: Text(categoryName,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:  Colors.white
                ),),
              )
          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {
   final String imageUrl,title,desc,url;

  BlogTile({required this.imageUrl, required this.title, required this.desc, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ArticleView(blog_Url: url)
          ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16 ),
        child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
      
              Text(title,style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 8,),
              Text(desc,style: TextStyle(
                color: Colors.black54
              ),)
        ],),
      ),
    );
  }
}
