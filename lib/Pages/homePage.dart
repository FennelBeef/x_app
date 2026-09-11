import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部导航栏
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5, // 细微的阴影线
        leadingWidth: 0, // 隐藏默认的返回按钮
        titleSpacing: 16, // 左侧距离
        title: Row(
          children: [
            const Text(
              '个人设备',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 24),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black87, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 8), // 右侧留白
        ],
      ),

      // 主体内容
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 开箱图标（原图是开着的箱子，这里用类似图标代替）
            Container(
              // 如果需要更精细的还原，建议换成图片
              child: const Icon(
                Icons.move_to_inbox_outlined,
                size: 100,
                color: Color(0xFFE0E0E0),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '暂无设备',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // 添加设备按钮
            SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3), // 蓝色
                  foregroundColor: Colors.white, // 文字白色
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text('添加设备', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),

      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // 多于3个通常为fixed
        selectedItemColor: const Color(0xFF2196F3), // 选中的蓝色
        unselectedItemColor: Colors.grey, // 未选中的灰色
        showUnselectedLabels: true,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '智家'),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
