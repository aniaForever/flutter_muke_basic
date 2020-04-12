import 'dart:convert';
import 'dart:io';

void main() {
  _getIPAddress();
}

_getIPAddress() async {
  var url = 'https://httpbin.org/ip';
  var httpClient = new HttpClient();

  String result;
  try {
    var request = await httpClient.getUrl(Uri.parse(url)); //创建 client. 构造 Uri.   返回一个future
    var response =
        await request.close(); //发起请求, 等待请求，同时您也可以配置请求headers、 body。关闭请求, 等待响应
    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(utf8.decoder).join(); //解码响应的内容.
      var data = jsonDecode(json);
      result = data['origin'];
    } else {
      result = 'Error getting IP address:\nHttp status ${response.statusCode}';
    }
  } catch (exception) {
    result = 'Failed getting IP address';
  }

  print(result);
}
