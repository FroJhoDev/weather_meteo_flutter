
class OpenMeteoApiUtil {

  static String baseUrl = 'https://api.open-meteo.com/v1/';
  static Uri weatherForecast ({required double latitude, required double longitude}) => Uri.parse('${baseUrl}forecast?latitude=$latitude&longitude=$longitude&daily=apparent_temperature_max,precipitation_probability_max&current_weather=true&timezone=America%2FSao_Paulo&forecast_days=1'); 

}