import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lendmark/lendmark.dart';
import 'modal.dart';

class listdata extends StatefulWidget {
  landmark lanmark;

  listdata(this.lanmark);

  @override
  State<listdata> createState() => _listdataState();
}

class _listdataState extends State<listdata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState((){
      Modeldata.allLandmarks().then((value) {
        if (value != null) value.forEach((item) {
          if (item.id == widget.lanmark.id){
            print(item);
            widget.lanmark = item;
          }});
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.lanmark.name}'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  color: Colors.grey,
                ),
                Column(
                  children: [
                    Container(
                      height: 200,
                    ),
                    Center(
                      child: Container(
                        //   margin: EdgeInsets.all(100),
                        height: 200,
                        child: GFAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(
                              'image/${widget.lanmark.imageName}.jpg'),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.lanmark.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.lanmark.isFavorite =
                                    widget.lanmark.isFavorite == true ? false : true;

                              });
                            },
                            icon: Icon(widget.lanmark.isFavorite == true ? Icons.star : Icons.star_border)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.lanmark.park}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${widget.lanmark.state}',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'About ${widget.lanmark.name}',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${widget.lanmark.description}',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
