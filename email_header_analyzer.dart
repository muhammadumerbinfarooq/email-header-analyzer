import dart:io ;

void main() {
  // Sample email header
  String emailHeader = '''
Received: from mail.example.com (mail.example.com. [192.0.2.1])
        by mx.google.com with ESMTPS id abc123
        for <user@example.com>;
        Mon, 16 Nov 2024 08:00:00 -0800 (PST)
Return-Path: <sender@example.com>
Received-SPF: pass (google.com: domain of sender@example.com designates 192.0.2.1 as permitted sender) client-ip=192.0.2.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@example.com header.s=selector1 header.b=abc123;
       spf=pass (google.com: domain of sender@example.com designates 192.0.2.1 as permitted sender) smtp.mailfrom=sender@example.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=example.com
From: Sender Name <sender@example.com>
To: User Name <user@example.com>
Subject: Test Email
Date: Mon, 16 Nov 2024 08:00:00 -0800 (PST)
Message-ID: <abc123@example.com>
''';

  // Parse the email header
  Map<String, String> parsedHeader = parseEmailHeader(emailHeader);

  // Display the parsed header
  parsedHeader.forEach((key, value) {
    print('$key: $value');
  });
}

Map<String, String> parseEmailHeader(String header) {
  Map<String, String> headerMap = {};
  List<String> lines = header.split('\n');

  for (String line in lines) {
    if (line.contains(':')) {
      int index = line.indexOf(':');
      String key = line.substring(0, index).trim();
      String value = line.substring(index + 1).trim();
      headerMap[key] = value;
    }
  }

  return headerMap;
}
