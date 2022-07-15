import 'package:carlos_alejano_v2/services/analytics/models/event.dart';
import 'package:carlos_alejano_v2/services/analytics/models/user_property.dart';
import 'package:rxdart/rxdart.dart';

class AnalyticsManager {
  final PublishSubject<Event> _eventPublisher = PublishSubject<Event>();
  final PublishSubject<UserProperty> _propertyPublisher = PublishSubject<UserProperty>();

  void trackEvent(Event event) {
    _eventPublisher.add(event);
  }

  void setUserProperty(UserProperty property) {
    _propertyPublisher.add(property);
  }

  PublishSubject<Event> get eventPublisher => _eventPublisher;
  PublishSubject<UserProperty> get propertyPublisher => _propertyPublisher;
}

class AnalyticsKeys {
  static const exception = 'exception';
  static const actionType = 'actionType';
}
