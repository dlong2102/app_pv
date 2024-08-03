import 'package:app_pv/pages/detail_product/detail_screen.dart';
import 'package:app_pv/pages/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:app_pv/config/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16),
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildCategories(),
              SizedBox(height: 16),
              _buildNearYourSection(context),
              SizedBox(height: 16),
              _buildBestForYourSection(),
            ],
          ),
        ),
      ),
    );
  }

  //////////////////////////
  ///Header
  //////////////////////////
  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location', style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                Text('Jakarta',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
        Icon(Icons.notifications_none, size: 30),
      ],
    );
  }

  //////////////////////////
  ///Search Bar
  //////////////////////////
  Widget _buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Search address, or near you',
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: colorButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryChip('House', isSelected: true),
          _buildCategoryChip('Apartment'),
          _buildCategoryChip('Hotel'),
          _buildCategoryChip('Villa'),
          _buildCategoryChip('Cottage'),
        ],
      ),
    );
  }

  //////////////////////////
  ///Category Chip
  //////////////////////////
  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected ? colorButton : null,
          color: isSelected ? null : Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white10,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : colorPrimary,
            ),
          ),
        ),
      ),
    );
  }

  //////////////////////////
  ///Near Your Section
  //////////////////////////
  Widget _buildNearYourSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Near from you',
                style: TextStyle(fontSize: 18, fontFamily: 'Raleway-Regular')),
            Text('See more', style: TextStyle(color: colorPrimary)),
          ],
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildNearYouCard(
                context,
                'Dreamsville House',
                'Jl. Sultan Iskandar Muda',
                '1.8 km',
                'assets/images/img1.jpg',
                6,
                4,
                'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... Show More',
                'Garry Allen',
                2500000000,
              ),
              SizedBox(width: 16),
              _buildNearYouCard(
                context,
                'Ascot House',
                'Jl. Cilandak Tengah',
                '2.1 km',
                'assets/images/img2.jpg',
                5,
                3,
                'A beautiful house with a spacious garden and modern amenities.',
                'Emma Watson',
                2000000000,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNearYouCard(
    BuildContext context,
    String title,
    String address,
    String distance,
    String image,
    int bedrooms,
    int bathrooms,
    String description,
    String agentName,
    double price,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              imageUrl: image,
              title: title,
              address: address,
              bedrooms: bedrooms,
              bathrooms: bathrooms,
              description: description,
              agentName: agentName,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 222,
        height: 272,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Image
              Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
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
              // Distance chip
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.24),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white70,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        distance,
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              // Title and address
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      address,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBestForYourSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Best for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('See more',
                style: TextStyle(color: Color.fromRGBO(133, 133, 133, 1))),
          ],
        ),
        SizedBox(height: 16),
        _buildBestForYourCard('Orchad House', 'Rp. 2.500.000.000 / Year', 6, 4,
            'assets/images/img3.jpg'),
        SizedBox(height: 16),
        _buildBestForYourCard('The Hollies House', 'Rp. 2.000.000.000 / Year',
            5, 2, 'assets/images/img4.jpg'),
      ],
    );
  }

  Widget _buildBestForYourCard(
      String title, String price, int bedrooms, int bathrooms, String image) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(price, style: TextStyle(color: Colors.blue)),
              Row(
                children: [
                  Icon(Icons.bed, size: 16, color: Colors.grey),
                  Text(' $bedrooms Bedroom',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Icon(Icons.bathtub, size: 16, color: Colors.grey),
                  Text(' $bathrooms Bathroom',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
