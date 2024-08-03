import 'package:app_pv/config/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final int bedrooms;
  final int bathrooms;
  final String description;
  final String agentName;
  final double price;

  const DetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.description,
    required this.agentName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img8.jpg',
      'assets/images/img9.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0.1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 400,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      padding: const EdgeInsets.only(left: 8),
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      icon: Icon(Icons.bookmark_border, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        address,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          _buildInfoItem(Icons.king_bed, '$bedrooms Bedroom'),
                          SizedBox(width: 16),
                          _buildInfoItem(Icons.bathtub, '$bathrooms Bathroom'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(description),
                  SizedBox(height: 16),
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(agentName),
                    subtitle: Text('Agent'),
                    contentPadding: EdgeInsets.only(left: 0),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(10, 142, 217, 0.5),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.phone, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(10, 142, 217, 0.5),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.message, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: imageUrls.sublist(0, 4).map((imageUrl) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(16, 0, 24, 0),
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 450,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage(imageUrls[4]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Relway-Regular',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. ${NumberFormat('###,###').format(price)}/Year',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {},
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              decoration: BoxDecoration(
                                gradient: colorButton,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Rent Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Relway-Regular',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
