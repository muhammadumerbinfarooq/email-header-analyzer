# Email Header Analyzer

A simple Dart application to parse and analyze email headers for digital forensics purposes.

## Features

- Parses email headers and extracts key-value pairs.
- Displays parsed header information in a readable format.

## Getting Started

### Prerequisites

- Dart SDK: Install Dart

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/muhammadumermemon/email-header-analyzer.git
    cd email-header-analyzer
    ```

2. Run the application:
    ```bash
    dart email_header_analyzer.dart
    ```

### Usage

- Modify the `emailHeader` variable in `email_header_analyzer.dart` with the email header you want to analyze.
- Run the application to see the parsed header information.

### Example

```dart
import 'dart:io';

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
  List<String>
