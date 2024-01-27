/// @description My name is .GIFfany!
if feedback == "> Oh... h... hi there!" {feedback += "#> My name is .GIFfany!"; alarm[3] = 90}
else if string_copy(feedback,1,5) == "> Oh." {feedback = "> My name is .GIFfany!#> I am a schoolgirl at School "; alarm[3] = 90}
else if string_copy(feedback,1,5) == "> My " {feedback = "> I am a schoolgirl at School#  University!"}