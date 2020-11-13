import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class AddPlacesPage extends StatefulWidget {
  @override
  _AddPlacesPageState createState() => _AddPlacesPageState();
}

class _AddPlacesPageState extends State<AddPlacesPage> {
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add places'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SafeArea(
          child: ScrollColumnExpandable(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search...',
                            ),
                            controller: _locationController,
                            onTap: () => PlacesAutocomplete.show(
                              context: context,
                              onTapPrediction: (prediction) {
                                Navigator.pop(context);
                                setState(() {
                                  _locationController.text =
                                      prediction.description;
                                });
                              },
                              onSubmitted: (value) {},
                            ),
                            readOnly: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: _locationController.text.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  size: 30,
                                ),
                                onPressed: _locationController.text.isEmpty
                                    ? null
                                    : () {
                                        setState(() {
                                          _locationController.clear();
                                        });
                                      }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
