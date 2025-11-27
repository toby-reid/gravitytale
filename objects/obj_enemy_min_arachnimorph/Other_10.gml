/// @description Transition to Spider

obj_battleCore.text[0] = "It's a spider person.&Who could have seen this #coming?";
self.is_spider = true;
self.at = 8;
self.hp += 16;
self.maxhp += 16;
self.acts_to_spare = 3;
self.name = "Arachnimorph";
self.act = [self.act[0], "Pizza", "Sand", "Boot"];
self.spare = false;
