/// @desc water
if (!water_warned && global.player.genocide != RUN.ACTIVE)
{
    if (global.player.kills == 0)
    {
        obj_battleCore.text[1] = "You hesitate for a moment as #you notice the sparks of #humanity in its eyes.";
        obj_battleCore.text[0] = "As pathetic as it is, #you just can't bring yourself #to do it.";
    }
    else if (global.player.genocide == RUN.ABORTED)
    {
        obj_battleCore.text[1] = "You hesitate for a moment.&This creature is not so differ-#ent from others you've spared.";
        obj_battleCore.text[0] = "A former version of you might #have destroyed the creature #without a second thought.";
    }
    else
    {
        obj_battleCore.text[1] = "You hesitate for a moment, #knowing this would destroy #the poor creature.";
        obj_battleCore.text[0] = "You steel yourself and prepare #your strike.";
    }
    water_warned = true;
    m_act();
}
else
{
    hp = (hp div 2) + 1;
    if (global.player.genocide == RUN.ACTIVE)
    {
        obj_battleCore.text[1] = "Without hesitation, you dump #water on the creature.&It hisses, but not from malice.";
        obj_battleCore.text[0] = "Could you be doing something #good for society, for once?";
    }
    else if (global.player.kills == 0)
    {
        obj_battleCore.text[1] = "You force yourself to watch #as the creature disintegrates.&It's the right thing to do.";
        obj_battleCore.text[0] = "You try to convince yourself, #anyway.";
    }
    else
    {
        obj_battleCore.text[1] = "You look away as the creature #disintegrates.&You just can't watch.";
        obj_battleCore.text[0] = "It's dishonorable, sure, but #since when were you concerned #about that?";
    }
}
