abstract class EventDataRepository{
  getEventDataFromApi();
}

class EventDataRepositoryImpl implements EventDataRepository {
  @override
  getEventDataFromApi() {
    return "yes";
  }
}