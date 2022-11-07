class ReservationModel{
 static String? movie_name;
 static int? day;
 static String? month;
 static String? time;
 static List<String> reserved_seats = List.empty(growable: true);

 static int num_of_selected_seats = 0;
 static int pay_sum = 0;

 static bool is_today = false;
 static bool is_tommorrow = false;

}