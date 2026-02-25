/*import 'package:flutter/material.dart';
import '../models/property_model.dart';

class PropertyListingScreen extends StatelessWidget {
  const PropertyListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample property data
    final property = Property(
      id: "1",
      title: "Student Apartment Near Campus",
      description:
          "Modern student apartment located 5 minutes from campus. Quiet study environment with fast WiFi included.",
      location: "Port Louis, Near University of Mauritius",
      price: 8500,
      images: [
        "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2",
        "https://images.unsplash.com/photo-1507089947368-19c1da9775ae",
      ],
      bedrooms: 2,
      bathrooms: 1,
      isStudentOnly: true,
      wifiIncluded: true,
      electricityIncluded: true,
      waterIncluded: true,
      furnished: true,
      landlordName: "Mr. Raman",
      rating: 4.5,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Property Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Property Images
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: property.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    property.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            /// Title & Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rs ${property.price.toStringAsFixed(0)} / month",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 5),
                  Expanded(child: Text(property.location)),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// Room Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoBox(Icons.bed, "${property.bedrooms} Bedrooms"),
                  _infoBox(Icons.bathtub, "${property.bathrooms} Bathrooms"),
                  _infoBox(Icons.chair,
                      property.furnished ? "Furnished" : "Unfurnished"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Amenities
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Amenities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (property.wifiIncluded) _amenityChip("WiFi Included"),
                  if (property.electricityIncluded)
                    _amenityChip("Electricity Included"),
                  if (property.waterIncluded) _amenityChip("Water Included"),
                  if (property.isStudentOnly) _amenityChip("Student Only"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(property.description),
            ),

            const SizedBox(height: 20),

            /// Landlord Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(property.landlordName),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 5),
                      Text(property.rating.toString()),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Contact"),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      /// Bottom Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text(
            "Book Viewing",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _infoBox(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 5),
        Text(text),
      ],
    );
  }

  Widget _amenityChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.blue.shade50,
    );
  }
}
 */

/*
//UPDATED CODE
import 'package:flutter/material.dart';
import '../models/property_model.dart';

class PropertyListingScreen extends StatelessWidget {
  final String city;
  final String budget;

  const PropertyListingScreen({
    super.key,
    required this.city,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    // Sample property list
    final List<Property> allProperties = [
      Property(
        id: "1",
        title: "Student Apartment Near Campus",
        description: "Modern student apartment located 5 minutes from campus.",
        location: "Port Louis",
        price: 8500,
        images: [
          "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2",
        ],
        bedrooms: 2,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: true,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mr. Raman",
        rating: 4.5,
      ),
      Property(
        id: "2",
        title: "Shared Room in Curepipe",
        description: "Affordable shared room perfect for students.",
        location: "Curepipe",
        price: 6000,
        images: [
          "https://images.unsplash.com/photo-1507089947368-19c1da9775ae",
        ],
        bedrooms: 1,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: false,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mrs. Devi",
        rating: 4.2,
      ),
    ];

    // Filter by selected city
    final filteredProperties =
        allProperties.where((property) => property.location == city).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Properties in $city"),
      ),
      body: filteredProperties.isEmpty
          ? const Center(
              child: Text(
                "No properties found for this location.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: filteredProperties.length,
              itemBuilder: (context, index) {
                final property = filteredProperties[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.network(
                          property.images.first,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Title
                            Text(
                              property.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 5),

                            /// Price
                            Text(
                              "Rs ${property.price.toStringAsFixed(0)} / month",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 5),

                            /// Bedrooms & Bathrooms
                            Row(
                              children: [
                                const Icon(Icons.bed, size: 18),
                                const SizedBox(width: 5),
                                Text("${property.bedrooms} Beds"),
                                const SizedBox(width: 15),
                                const Icon(Icons.bathtub, size: 18),
                                const SizedBox(width: 5),
                                Text("${property.bathrooms} Bath"),
                              ],
                            ),

                            const SizedBox(height: 10),

                            /// View Details Button
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PropertyDetailsScreen(
                                              property: property),
                                    ),
                                  );
                                },
                                child: const Text("View Details"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}

/// 🔥 PROPERTY DETAILS SCREEN
class PropertyDetailsScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              property.images.first,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rs ${property.price.toStringAsFixed(0)} / month",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(property.description),
                  const SizedBox(height: 20),
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      if (property.wifiIncluded)
                        const Chip(label: Text("WiFi Included")),
                      if (property.electricityIncluded)
                        const Chip(label: Text("Electricity Included")),
                      if (property.waterIncluded)
                        const Chip(label: Text("Water Included")),
                      if (property.isStudentOnly)
                        const Chip(label: Text("Student Only")),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Book Viewing"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */

// NEW CODE
import 'package:flutter/material.dart';
import '../models/property_model.dart';

class PropertyListingScreen extends StatelessWidget {
  final String city;
  final String budget;

  const PropertyListingScreen({
    super.key,
    required this.city,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    /// 🔥 FULL PROPERTY LIST
    final List<Property> allProperties = [
      Property(
        id: "1",
        title: "Student Apartment Near Campus",
        description: "Modern student apartment located 5 minutes from campus.",
        location: "Port Louis",
        price: 8500,
        images: [
          "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2",
        ],
        bedrooms: 2,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: true,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mr. Raman",
        rating: 4.5,
      ),
      Property(
        id: "2",
        title: "Shared Room in Curepipe",
        description: "Affordable shared room perfect for students.",
        location: "Curepipe",
        price: 6000,
        images: [
          "https://images.unsplash.com/photo-1507089947368-19c1da9775ae",
        ],
        bedrooms: 1,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: false,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mrs. Devi",
        rating: 4.2,
      ),
      Property(
        id: "3",
        title: "Student Room in Quatre Bornes",
        description: "Cozy furnished room near metro station.",
        location: "Quatre Bornes",
        price: 7500,
        images: [
          "https://images.unsplash.com/photo-1493809842364-78817add7ffb",
        ],
        bedrooms: 1,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: true,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mr. Jean",
        rating: 4.6,
      ),
      Property(
        id: "4",
        title: "Student Studio in Vacoas",
        description: "Affordable studio perfect for university students.",
        location: "Vacoas",
        price: 9000,
        images: [
          "https://images.unsplash.com/photo-1572120360610-d971b9d7767c",
        ],
        bedrooms: 1,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: false,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mrs. Pillay",
        rating: 4.3,
      ),
      Property(
        id: "5",
        title: "Student Room in Rose Hill",
        description: "Close to bus station and shopping areas.",
        location: "Rose Hill",
        price: 7000,
        images: [
          "https://images.unsplash.com/photo-1484154218962-a197022b5858",
        ],
        bedrooms: 1,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: true,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mr. Ali",
        rating: 4.1,
      ),
      Property(
        id: "6",
        title: "Student Apartment in Grand Baie",
        description: "Modern apartment near beach and amenities.",
        location: "Grand Baie",
        price: 10000,
        images: [
          "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688",
        ],
        bedrooms: 2,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: true,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mr. Laurent",
        rating: 4.8,
      ),
      Property(
        id: "7",
        title: "Student Studio in Flic en Flac",
        description: "Sea view studio with fast WiFi included.",
        location: "Flic en Flac",
        price: 9500,
        images: [
          "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
        ],
        bedrooms: 1,
        bathrooms: 1,
        isStudentOnly: true,
        wifiIncluded: true,
        electricityIncluded: true,
        waterIncluded: true,
        furnished: true,
        landlordName: "Mrs. Marie",
        rating: 4.7,
      ),
    ];

    /// 🔥 FILTER LOGIC
    final double? selectedBudget = double.tryParse(budget);

    final filteredProperties = allProperties.where((property) {
      final matchesCity = property.location.toLowerCase() == city.toLowerCase();

      final matchesBudget =
          selectedBudget == null || property.price <= selectedBudget;

      final matchesStudent = property.isStudentOnly;

      return matchesCity && matchesBudget && matchesStudent;
    }).toList();

    /// 🔥 SORT BY PRICE (LOW → HIGH)
    filteredProperties.sort((a, b) => a.price.compareTo(b.price));

    return Scaffold(
      appBar: AppBar(
        title: Text("Properties in $city"),
      ),
      body: filteredProperties.isEmpty
          ? const Center(
              child: Text(
                "No student properties found within your budget.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: filteredProperties.length,
              itemBuilder: (context, index) {
                final property = filteredProperties[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          property.images.first,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Rs ${property.price.toStringAsFixed(0)} / month",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.bed, size: 18),
                                const SizedBox(width: 5),
                                Text("${property.bedrooms} Beds"),
                                const SizedBox(width: 15),
                                const Icon(Icons.bathtub, size: 18),
                                const SizedBox(width: 5),
                                Text("${property.bathrooms} Bath"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PropertyDetailsScreen(
                                        property: property,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("View Details"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}

/// 🔥 PROPERTY DETAILS SCREEN
class PropertyDetailsScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailsScreen({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              property.images.first,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rs ${property.price.toStringAsFixed(0)} / month",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(property.description),
                  const SizedBox(height: 20),
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      if (property.wifiIncluded)
                        const Chip(label: Text("WiFi Included")),
                      if (property.electricityIncluded)
                        const Chip(label: Text("Electricity Included")),
                      if (property.waterIncluded)
                        const Chip(label: Text("Water Included")),
                      if (property.isStudentOnly)
                        const Chip(label: Text("Student Only")),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Book Viewing"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
