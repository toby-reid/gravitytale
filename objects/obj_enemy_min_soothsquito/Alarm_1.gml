/// @description Spellcheck

obj_battleCore.text[1] = "You attempt to teach the Sooth-#squito how to use spelling #checkers.";
if (self.cilantro)
{
    obj_battleCore.text[0] = "The Soothsquito appreciates #your tips and agrees to leave #you be.";
    self.spare = true;
}
else
{
    obj_battleCore.text[0] = "The Soothsquito appreciates #your tips and seeks practice.&...on you.";
}
self.spellcheck = true;
