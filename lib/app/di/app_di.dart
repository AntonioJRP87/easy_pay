import 'package:easy_pay/data/di/data_di.dart';
import 'package:easy_pay/domain/di/domain_di.dart';
import 'package:easy_pay/presentation/di/presentation_di.dart';

Future<void> init() async {
  dataInitDi();
  domainInitDi();
  presentationInitDi();
}