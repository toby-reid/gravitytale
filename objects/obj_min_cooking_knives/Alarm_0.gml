with instance_create_layer(160, 192, layer, obj_textbox)
{
    var _success = obj_min_cookingDate.was_fried_first;
    var _feedback;
    if (_success)
    {
        _feedback = global.player.mabel ? "My, that's delicious!" : "It's acceptable.";
    }
    else if (!obj_min_cookingDate.is_butter_fried)
    {
        _feedback = "Y'all gotta @99D9EAfry the butter@ffffff!&It's kinda the whole point #of @99D9EAdeep-fried butter@ffffff!";
    }
    else if (!obj_min_cookingDate.is_butter_dipped)
    {
        _feedback = "This butter is too bland!&Try @99D9EAdipping it in some-#thing@ffffff to bring out its flavor!";
    }
    else
    {
        _feedback = "Oh, honey...&Y'all deep-fried the sauce, #not the butter!";
    }
    var _count_feedback;
    if _success
    {
        if (obj_min_cookingDate.correct_count == 1)
        {
            if (obj_min_cookingDate.failed_count == 0)
            {
                _count_feedback = string_concat(
                    "And on your first try--^^&",
                    global.player.mabel ? "As expected of my #captivating queen!" : "I reckon that oughtta #be praised!"
                );
            }
            else
            {
                _count_feedback = global.player.mabel ? "I just knew you'd get it, #my sweet!" : "It's about time y'all #figured it out...";
            }
        }
        else
        {
            _count_feedback = global.player.mabel ? "Yet another expertly-made product!&You're a natural!" : "Not bad, friend.&Keep it up.";
        }
    }
    else
    {
        if (obj_min_cookingDate.correct_count != 0)
        {
            _count_feedback = global.player.mabel
                ? "Look, hon, I appreciate #the creativity, but y'all #gotta stick to the script!"
                : "Come on, pal, you had it!&Alright, try it again.";
        }
        else if (obj_min_cookingDate.failed_count == 1)
        {
            _count_feedback = global.player.mabel ? "Ooh, so close!&Give it another try!" : "Sorry, that doesn't count!&Try again, partner!";
        }
        else
        {
            _count_feedback = global.player.mabel
                ? "Oh, don't worry about it, love.&You'll get it!"
                : "Come on, partner, it's not @99D9EAthat@ffffff difficult!";
        }
    }
    text = [
        "ALRIGHT, HON, LET'S HAVE #A TASTE.",
        ". . .",
        string_upper(_feedback),
        string_upper(_count_feedback)
    ];
    for (var i = 0; i < array_length(text); ++i)
    {
        sound[i] = tlk_gideon;
    }
    setMove = true;
}
obj_min_cookingDate.has_butter = false;
obj_min_cookingDate.is_butter_fried = false;
obj_min_cookingDate.is_butter_dipped = false;
obj_min_cookingDate.was_fried_first = false;
