import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_app/Pages/country.dart';

// 类名大驼峰规范
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _showText = "中国";
  bool _isPasswordVisible = false;
  bool _isAgreed = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _countryCtrl = TextEditingController();

  @override
  void dispose() {
    // 释放控制器，内存安全
    _username.dispose();
    _password.dispose();
    _countryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. 右上角语言选择
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '简体中文',
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 2. Logo 和 App 名称
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B99FC),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'X',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // 3. 国家/地区选择【修复核心位置】
              InkWell(
                onTap: () async {
                  final Country? result = await context.push<Country>(
                    '/country',
                  );
                  if (result != null) {
                    setState(() {
                      print(result.name);
                      _showText = result.name;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // =========修复这里！去掉const，绑定_showText=========
                      Text(
                        _showText,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey[200]),
              // 4. 手机号/邮箱 输入框，绑定controller
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: '手机号/邮箱',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
              Divider(height: 1, color: Colors.grey[200]),
              // 5. 密码输入框，绑定controller
              TextFormField(
                controller: _password,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '6-16位数字、字母、符号',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey[200]),
              const SizedBox(height: 10),
              // 6. 忘记密码
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  '忘记密码',
                  style: TextStyle(color: Color(0xFF3B99FC), fontSize: 14),
                ),
              ),
              const SizedBox(height: 30),
              // 7. 登录按钮
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/homePage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB3D4FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // 8. 注册按钮
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6F2FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '注册',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3B99FC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              // 9. 第三方登录 (替换掉不存在的wechat图标)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: const Icon(
                      Icons.chat, // 替换微信图标
                      color: Color(0xFF07C160),
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 25),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Color(0xFF1677FF),
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // 10. 底部协议勾选
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: Checkbox(
                      value: _isAgreed,
                      onChanged: (value) {
                        setState(() {
                          _isAgreed = value!;
                        });
                      },
                      shape: const CircleBorder(),
                      side: BorderSide(color: Colors.grey[400]!, width: 1),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: const Color(0xFF3B99FC),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '已阅读并同意',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            '《服务协议》',
                            style: TextStyle(
                              color: Color(0xFF3B99FC),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          ' 和 ',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            '《隐私声明》',
                            style: TextStyle(
                              color: Color(0xFF3B99FC),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
