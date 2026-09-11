import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Country {
  final String name;
  final String code;
  Country({required this.name, required this.code});
}

class country extends StatelessWidget {
  const country({super.key});

  static final List<Country> countryList = [
    Country(name: "中国", code: "CN"),
    Country(name: "美国", code: "US"),
    Country(name: "英国", code: "GB"),
    Country(name: "日本", code: "JP"),
    Country(name: "韩国", code: "KR"),
    Country(name: "德国", code: "DE"),
    Country(name: "法国", code: "FR"),
    Country(name: "意大利", code: "IT"),
    Country(name: "加拿大", code: "CA"),
    Country(name: "澳大利亚", code: "AU"),
    Country(name: "新西兰", code: "NZ"),
    Country(name: "俄罗斯", code: "RU"),
    Country(name: "印度", code: "IN"),
    Country(name: "巴西", code: "BR"),
    Country(name: "墨西哥", code: "MX"),
    Country(name: "西班牙", code: "ES"),
    Country(name: "葡萄牙", code: "PT"),
    Country(name: "荷兰", code: "NL"),
    Country(name: "瑞士", code: "CH"),
    Country(name: "瑞典", code: "SE"),
    Country(name: "挪威", code: "NO"),
    Country(name: "丹麦", code: "DK"),
    Country(name: "芬兰", code: "FI"),
    Country(name: "奥地利", code: "AT"),
    Country(name: "比利时", code: "BE"),
    Country(name: "波兰", code: "PL"),
    Country(name: "捷克", code: "CZ"),
    Country(name: "匈牙利", code: "HU"),
    Country(name: "泰国", code: "TH"),
    Country(name: "越南", code: "VN"),
    Country(name: "马来西亚", code: "MY"),
    Country(name: "新加坡", code: "SG"),
    Country(name: "印度尼西亚", code: "ID"),
    Country(name: "菲律宾", code: "PH"),
    Country(name: "沙特阿拉伯", code: "SA"),
    Country(name: "阿联酋", code: "AE"),
    Country(name: "土耳其", code: "TR"),
    Country(name: "南非", code: "ZA"),
    Country(name: "阿根廷", code: "AR"),
    Country(name: "智利", code: "CL"),
    Country(name: "哥伦比亚", code: "CO"),
    Country(name: "乌克兰", code: "UA"),
    Country(name: "希腊", code: "GR"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('选定国家')),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (ctx, index) {
          final item = countryList[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.code),
            onTap: () {
              // 点击选中，pop回上一页，携带Country对象
              context.pop(item);
            },
          );
        },
      ),
    );
  }
}
