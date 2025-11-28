/// @description Spice

obj_battleCore.text[1] = "You rub cilantro all over your #body.&Odd choice, but you do you.";
if (self.spellcheck)
{
    obj_battleCore.text[0] = "The Soothsquito no longer #wishes to practice on you.";
    self.spare = true;
}
else
{
    obj_battleCore.text[0] = "The Soothsquito no longer #wishes to bite you.&Look it up; it works.";
}
self.cilantro = true;
