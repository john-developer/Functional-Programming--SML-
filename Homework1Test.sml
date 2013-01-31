(* Returns true if result = expected *)
fun assert_values (result, expected) =
    result = expected

(* Returns true if result (int list) = expected (int list) *) 
fun assert_int_lists (result : int list, expected : int list) = 
    if null result andalso null expected then true
    else if null result andalso not (null expected) then false
    else if not (null result) andalso null expected then false
    else 
	let val flag = hd result = hd expected
	in
	   if flag then assert_int_lists(tl result, tl expected)
	   else false
	end

(* Returns true if result (int list)  = expected (int list) *)
fun assert_int_lists_triple (result : (int*int*int) list, expected : (int*int*int) list) = 
    if null result andalso null expected then true
    else if null result andalso not (null expected) then false
    else if not (null result) andalso null expected then false
    else 
	let val flag =  hd result = hd expected
	in
	   if flag then assert_int_lists_triple(tl result, tl expected)
	   else false
	end

val DATE1 = (1900, 4, 5)
val DATE2 = (1925, 4, 4)
val DATE3 = (1925, 3, 3)
val DATE4 = (2013, 1, 1)
val DATE5 = (2013, 1, 2)
val DATE6 = (~1000, 1, 2)

(* Test cases for P1 is_older function *)
val test_case1_1 = assert_values(is_older(DATE1, DATE1), false)
val test_case1_2 = assert_values(is_older(DATE1, DATE2), true)
val test_case1_3 = assert_values(is_older(DATE2, DATE1), false)
val test_case1_4 = assert_values(is_older(DATE3, DATE4), true)
val test_case1_5 = assert_values(is_older(DATE4, DATE3), false)
val test_case1_6 = assert_values(is_older(DATE5, DATE4), false)
val test_case1_7 = assert_values(is_older(DATE6, DATE1), true)
val test_case1_8 = assert_values(is_older(DATE1, DATE6), false)

(* Test cases for P2 number_in_month function *)
val test_case2_1 = assert_values(number_in_month([DATE1, DATE2, DATE3, DATE4, DATE5], 4), 2 )
val test_case2_2 = assert_values(number_in_month([DATE1, DATE2, DATE3, DATE4, DATE5], 1), 2 )
val test_case2_3 = assert_values(number_in_month([DATE1, DATE2, DATE3, DATE4, DATE5], 5), 0 )

(* Test cases for P3 number_in_months function *)
val test_case3_1 = assert_values(number_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [1, 2]), 2 )
val test_case3_2 = assert_values(number_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [3, 6]), 1 )
val test_case3_3 = assert_values(number_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [1, 4, 3]), 5 )
val test_case3_4 = assert_values(number_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [5, 6, 7]), 0 )

(* Test cases for P4 dates_in_month function *)
val test_case4_1 = assert_int_lists_triple(dates_in_month([DATE1, DATE2, DATE3, DATE4, DATE5], 1), [DATE4, DATE5])
val test_case4_2 = assert_int_lists_triple(dates_in_month([DATE1, DATE2, DATE3, DATE4, DATE5], 2), [])
val test_case4_3 = assert_int_lists_triple(dates_in_month([DATE1, DATE2, DATE3, DATE4, DATE5], 3), [DATE3])

(* Test cases for P5 dates_in_months function *)
val test_case5_1 = assert_int_lists_triple(dates_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [1,2]), [DATE4, DATE5])
val test_case5_2 = assert_int_lists_triple(dates_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [3,4]), [DATE1, DATE2, DATE3])
val test_case5_3 = assert_int_lists_triple(dates_in_months([DATE1, DATE2, DATE3, DATE4, DATE5], [5, 6, 17]), [])

val STR1 = "sand"
val STR2 = "moler"
val STR3 = "film"
val STR4 = "steel"

(* Test cases for P6 get_nth function *)
val test_case6_1 = assert_values(get_nth([STR1, STR2, STR3, STR4], 1), STR1)
val test_case6_2 = assert_values(get_nth([STR1, STR2, STR3, STR4], 2), STR2)
val test_case6_3 = assert_values(get_nth([STR1, STR2, STR3, STR4], 3), STR3)
val test_case6_4 = assert_values(get_nth([STR1, STR2, STR3, STR4], 4), STR4)
val test_case6_5 = assert_values(get_nth([STR1, STR2, STR3, STR4], 5), "")

(* Test cases for P7 date_to_string function *)
val test_case7_1 = assert_values(date_to_string(DATE1), "April 5, 1900")
val test_case7_2 = assert_values(date_to_string(DATE2), "April 4, 1925")
val test_case7_3 = assert_values(date_to_string(DATE3), "March 3, 1925")
val test_case7_4 = assert_values(date_to_string(DATE4), "January 1, 2013")
val test_case7_5 = assert_values(date_to_string(DATE5), "January 2, 2013")
val test_case7_6 = assert_values(date_to_string(DATE6), "January 2, ~1000")

(* Test cases for P8 number_before_reaching_sum function *)
val test_case8_1 = assert_values(number_before_reaching_sum(11, [3, 6, 9, 12]), 2)
val test_case8_2 = assert_values(number_before_reaching_sum(20, [3, 6, 9, 12]), 3)
val test_case8_3 = assert_values(number_before_reaching_sum(29, [3, 6, 9, 12]), 4)

(* Test cases for P9 what_month function *)
val test_case9_1 = assert_values(what_month(59), 2)
val test_case9_2 = assert_values(what_month(90), 3)
val test_case9_3 = assert_values(what_month(335), 12)

