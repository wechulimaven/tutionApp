import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutionapp/model/model.dart';


class TutorSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.search), onPressed: (){
              showSearch(context: context, delegate: dataSearch());
            },
          )
        ],
      ),
      
    );
  }
}

class dataSearch extends SearchDelegate<String>{
  // final List<String> _words;
  // final String _recentSearch;

  
  // Tutors pdts;
  // final tutorsList = pdts.items;
  final recentSearch = [
  'mike','english', 'math'
];


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isNotEmpty ?
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ) : IconButton(
        icon: const Icon(Icons.mic),
        tooltip: 'Voice input',
        onPressed: () {
          this.query = 'TBW: Get input from voice';
        },

      ),
    ];
      
      // throw UnimplementedError();
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
      // throw UnimplementedError();
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('===Your Word Choice==='),
            GestureDetector(
              onTap: () {
                //Define your action when clicking on result item.
                //In this example, it simply closes the page
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
      // throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    final tutorsData = Provider.of<Tutors>(context);
    final List<Tutor> tutorsList = tutorsData.items;
    // final tutorsData = Provider.of<Tutors>(context).toString();

    // final tutorsList = tutorsData.items;
    
    final Iterable<String> suggestionList = this.query.isEmpty 
    ? recentSearch 
    : tutorsData;
    // : tutorsList.where((p) => p.name.startsWith(query));
    return SearchSuggestionList(
      query: this.query,
      suggestionsList: suggestionList.toList(),
      onSelected: (String suggestion){
        this.query = suggestion;
        this.recentSearch.insert(0, suggestion);
        showResults(context);
      },
    );
    // final Iterable<String> suggestions = this.query.isEmpty
    //     ? recentSearch
    //     : tutorsList.where((word) => word.name.startsWith(query));

    
    // final suggestionList = this.query.isEmpty 
    // ? recentSearch 
    // : tutorsList.where((p) => p.name.startsWith(query));
    // return ListView.builder(
    //   itemBuilder: (context, index) => ListTile(
    //     leading: Icon(Icons.location_city),
    //     title: Text(suggestionList[index]),
    //     ),
    //     itemCount: suggestionList.length,
    // );
    // throw UnimplementedError();
  }
  
  
}
class SearchSuggestionList extends StatelessWidget {
  const SearchSuggestionList({this.suggestionsList, this.query, this.onSelected});

  final List<String> suggestionsList;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
        return ListView.builder(
      itemCount: suggestionsList.length,
      itemBuilder: (BuildContext context, index){
        final String suggestion = suggestionsList[index];
        return ListTile(
          // leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          leading: Icon(Icons.location_city),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          // title: RichText(
          //   text: TextSpan(
          //     text: suggestion[index].substring(0, query.length),
          //     // style: textTheme.copyWith(fontWeight: FontWeight.bold),
          //     style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
          //     children: <TextSpan>[
          //       TextSpan(
          //         text: suggestion[index].substring(query.length),
          //         style: textTheme
          //         // style: TextStyle(color:Colors.grey, fontWeight: FontWeight.bold),
          //          ), 
                
          //     ]
          //   )
          // ),
          onTap: (){
            onSelected(suggestion);
          },
        );
      },
      
    );
  }
}
// 1054388772283-40ciled37e3eani7pimpscvtj8agvgi8.apps.googleusercontent.com
// 1054388772283-ef0scu33nbnjmhgmbl6vgiunin4j6dg9.apps.googleusercontent.com