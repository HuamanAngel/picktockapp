import 'package:flutter/material.dart';
import 'package:picktock/data/models/categorie.dart';
import 'package:picktock/data/repository/http_cat_repository.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _isLoading = false;
  setLoading(bool state) => setState(() => _isLoading = state);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              'Categorías',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        child: FutureBuilder<List<Categorie>>(
                          future: HttpCatRepository().listar(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(snapshot.data![index].titulo),
                                    onTap: () {
                                      Navigator.pushNamed(context, '/categorie',
                                          arguments: snapshot.data![index]);
                                    },
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
