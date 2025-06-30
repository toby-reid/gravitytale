if (instance_exists(obj_dipper))
{
    switch (self.stage)
    {
        case 0:
            if (obj_dipper.canMove)
            {
                if (obj_dipper.x >= 80)
                {
                    obj_dipper.canMove = false;
                    self.vspeed = 0.5;
                    // ... float down using an umbrella
                    // Start to say something, note how dark it is, and call obj_min_roomBrightener.make_bright()
                    // ... say how the game works (love confession comes later)
                    // ... push self out of the room
                }
            }
            else if (self.y >= 100)
            {
                self.vspeed = 0;
                self.y = 100;
                self.stage++;
            }
        break;
        case 1:
            // Put the umbrella away
            
    }
}
