(* P1 - Returns true if 'date1' is older than 'date2' *)
fun is_older (date1 : (int * int * int), date2 : (int * int * int)) = 
    if ( #1 (date1) < #1 (date2)) then true
    else if ( #1 (date1) = #1 (date2)) andalso (#2 (date1) < #2 (date2)) then true
    else if ( #1 (date1) = #1 (date2)) andalso (#2 (date1) = #2 (date2)) andalso (#3 (date1) < #3 (date2)) then true
    else false

(* P2 - Returns the number of  occurances of 'month' in 'dates' *)
fun number_in_month (dates : (int * int * int) list, month : int) = 
    if null dates then 0
    else if ( #2 (hd dates) = month) then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)

(* P3 - Returns the amount of occurances of 'month' in 'dates' *)
fun number_in_months (dates : (int * int * int) list, month : int list) = 
    if null month then 0
    else number_in_month(dates, hd month) + number_in_months(dates, tl month)

(* P4 - Returns a list of dates from 'dates' that have 'month' *)
fun dates_in_month (dates : (int * int * int) list, month : int) = 
    if null dates then []
    else if ( #2 (hd dates) = month) then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

(* P5 - Returns a list of dates from 'dates' that match a month in 'months' *)
fun dates_in_months (dates : (int * int * int) list, months : int list) = 
    if null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* P6 - Returns the 'n'th element in the list 'strings' *)
fun get_nth (strings : string list, n: int) =
    if null strings then ""
    else if n = 1 then hd strings
    else get_nth(tl strings, n-1)

val MONTH_LIST = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

(* P7 - Returns a string representation of the date: 'date' *)
fun date_to_string (date : int * int * int) = 
    get_nth(MONTH_LIST, #2 (date)) ^ " " ^ (Int.toString (#3 (date))) ^ ", " ^ (Int.toString (#1 (date)))

(* P8 - Returns the last number in 'nums1' before the accumulated sum exceeds 'sum1' *)
fun number_before_reaching_sum (sum : int, nums : int list) =
    let
      fun accum (i : int, nums : int list) =
          if (i + hd nums) >= sum then 0
          else accum (i + hd nums, tl nums) + 1
    in
          accum(0, nums)
    end

val MONTHS_DAYS =  [31,28,31,30,31,30,31,31,30,31,30,31]

(* P9 - Returns the month that contains the day: 'day' *)
fun what_month (day : int) =
    number_before_reaching_sum(day, MONTHS_DAYS) + 1
