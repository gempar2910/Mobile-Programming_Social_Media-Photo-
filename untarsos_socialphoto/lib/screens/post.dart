import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int selectedIndex = -1; // untuk pilih gambar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔼 Custom AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "New Post",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // next ke halaman caption misalnya
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Next clicked")),
              );
            },
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),

      body: Column(
        children: [
          // 🔲 Preview besar
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.grey[300],
            child: selectedIndex == -1
                ? const Center(
                    child: Icon(Icons.image, size: 80, color: Colors.white70),
                  )
                : Center(
                    child: Text(
                      "Image $selectedIndex",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),

          const SizedBox(height: 8),

          // 🔽 Recents label
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: const [
                Text(
                  "Recents",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.red),
                Spacer(),
                Icon(Icons.collections, color: Colors.grey),
              ],
            ),
          ),

          // 🔲 Grid foto recents
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        "Img $index",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 🔽 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // posisi Post
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
