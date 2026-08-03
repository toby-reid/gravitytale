/// @desc Fold
// works for 5-7
if (stage == 0)
{
    m_act_before_check("fold");
}
else if (clone_number < 5)
{
    obj_battleCore.text[1] = "You were about to fold, #but then you remembered #you aren't playing poker.";
    obj_battleCore.text[0] = (clone_number == 2)
        ? "Too bad you can't call or bet.&You still have another option #though."
        : "They seem to be some kind of #high-quality cardstock, not normal #paper anyway.";
}
else if (clone_number > 7)
{
    obj_battleCore.text[1] = string_concat("You try to fold up ", name, ", #but he kind of... hisses?");
    obj_battleCore.text[0] = "It seems the clones learn #from your past battles.&Those darned journals.";
}
else
{
    obj_battleCore.text[1] = string_concat(
        "You show ",
        name,
        " how to make #",
        choose(
            "a dragon",
            "a hat",
            "satellite solar panels",
            "the perfect crease",
            "a snake",
            "a beetle",
            "a horse",
            "a monocular triangle",
            "a birb",
            "a crane",
            "a camel",
            "a sword",
            "a fish"
        ),
        ".&He seems excited."
    );
    obj_battleCore.text[0] = string_concat(name, " is ready to leave #to practice the new moves on #himself.");
    spare = true;
}
action = 1;
