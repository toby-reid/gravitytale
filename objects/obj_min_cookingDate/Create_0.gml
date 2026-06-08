// This object acts like a "state machine" of sorts to keep track of Gideon's date.

washed = false; // make sure it's named `washed`, or at least whatever obj_min_cooking_sink uses
has_butter = false;
is_butter_fried = false;
is_butter_dipped = false;
was_fried_first = false;

correct_count = 0;
failed_count = 0;
