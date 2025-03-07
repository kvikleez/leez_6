import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fl_chart/fl_chart.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 150,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            elevation: 2,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Seller Dashboard",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            actions: [
              IconButton(
                icon: const Icon(LucideIcons.bell, color: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _sectionTitle("Overview"),
                _buildOverviewCards(),
                _sectionTitle("Performance Analytics"),
                _buildPerformanceGraph(),
                _sectionTitle("Top Performing Products"),
                _buildProductList(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildStatCard("Total Listings", "284", LucideIcons.package),
              _buildStatCard("Active Rentals", "156", LucideIcons.checkCircle),
            ],
          ),
          Row(
            children: [
              _buildStatCard("Pending Requests", "42", LucideIcons.timer),
              _buildStatCard("Total Revenue", "₹4.3L", LucideIcons.wallet),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceGraph() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(1, 1.5),
                  FlSpot(2, 4),
                  FlSpot(3, 2),
                  FlSpot(4, 5),
                ],
                isCurved: true,
                color: const Color.fromARGB(255, 0, 0, 0),
                barWidth: 3,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildProductCard("Red Car Max 2024", "assets/car4.jpg", "2.4k views", "126 requests"),
          _buildProductCard("White Car Pro", "assets/car1.png", "1.8k views", "94 requests"),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String imagePath, String views, String requests) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 206, 206),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.fitWidth),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text(views, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
                Text(requests, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
