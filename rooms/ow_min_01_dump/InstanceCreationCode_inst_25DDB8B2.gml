sprite_index = spr_scb_toilet;
text = ["(It's a toilet.)", "(Flush?)"];
choices = [undefined, ["Yes", "No"]];
actions = [undefined, [
    function() { obj_textbox.set_text("(Nothing happened.&(It's like it's not hooked up #or something.)", 2); }
]];
