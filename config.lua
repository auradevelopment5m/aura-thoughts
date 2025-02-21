return {
    -- Enable or disable version checking for the github repository
    
    versionCheck = true,
    
    -- Enable or disable debug mode
    debug = false,
    
    Zones = {
        -- Sewer zone configuration
        Sewer = {
            enabled = true,  -- Enable or disable this zone
            coords = vec3(1031.7, -271.42, 50.82),  -- Coordinates of the zone center
            radius = 5,  -- Radius of the zone in meters
            icon = 'fa-poo',  -- Font Awesome icon to display
            duration = 5000,  -- Duration in milliseconds (for temporary thoughts)
            randomThoughts = true,  -- Whether to display thoughts randomly or in order
            type = "persistent",  -- 'persistent' (stays while in zone) or 'temporary' (disappears after duration)
            thoughts = {
                "It stinks here! Did someone forget to flush the entire city?",
                "Eau de Sewer: Not the fragrance I was hoping for today.",
                "I've heard of 'getting down and dirty', but this is ridiculous!",
                "Note to self: 'Sewer Explorer' is not a viable career option.",
                "Is this what they mean by 'hitting rock bottom'?",
                "I've got a feeling we're not in Chanel No. 5 territory anymore.",
                "Suddenly, my own cooking doesn't smell so bad.",
                "If 'Essence of Yuck' was a perfume, this would be it.",
                "I've found the source of the mysterious green glow... I wish I hadn't.",
                "This must be where bad odors go to level up.",
                "I always wanted to be in a stinky situation, said no one ever.",
                "Breathe through your mouth, they said. It'll be fine, they said.",
                "I should've brought a clothespin... and a hazmat suit.",
                "Is this what they mean by 'immersive gaming experience'?",
                "I've discovered where smells go to die... and be reborn as super-smells!"
            }
        },

        -- White Widow zone configuration
        WhiteWidow = {
            enabled = true,
            coords = vec3(202.91, -239.06, 53.97),
            radius = 5,
            icon = 'fa-cannabis',
            duration = 5000,
            randomThoughts = true,
            type = "persistent",
            thoughts = {
                "One more hit and I'm out... said me an hour ago.",
                "I should probably leave... right after this joint.",
                "My wallet's telling me no, but my lungs are telling me yes.",
                "I came in for a gram and left with an ounce. Oops?",
                "White Widow: Where time flies and so does your money.",
                "I'm not addicted, I just really, really, really like being here.",
                "Leaving? But the couch and I were just getting acquainted!",
                "I should go home... but home doesn't have this menu.",
                "My productivity is inversely proportional to my visits here.",
                "I'm supporting local business. That's my story and I'm sticking to it.",
                "I promise this is my last visit... this hour.",
                "I'm not loitering, I'm just... admiring the decor. For the 50th time.",
                "My budget says no, but my stress levels say yes.",
                "I should leave... but what if they get new strains while I'm gone?",
                "I'm not addicted, I can stop anytime. I just don't want to. Ever."
            }
        },

        -- Courthouse zone configuration
        Courthouse = {
            enabled = true,
            coords = vec3(-544.77, -205.13, 38.22),
            radius = 10,
            icon = 'fa-gavel',
            duration = 5000,
            randomThoughts = true,
            type = "persistent",
            thoughts = {
                "Note to self: Don't become a regular here.",
                "I plead the FIF... wait, wrong country.",
                "Is it too late to become a law-abiding citizen?",
                "I hope they don't have a frequent visitor program.",
                "Courthouse? More like line-waiting simulator 2023.",
                "I swear, Your Honor, the dog ate my parking tickets!",
                "If I stand still enough, maybe they'll think I'm a statue.",
                "I'm just here for the free legal advice... said no one ever.",
                "Jury duty? More like 'duty to nap in uncomfortable chairs'.",
                "I should've watched more Law & Order to prepare for this.",
                "Is bribing the judge with compliments considered contempt?",
                "I'm not guilty, I'm just... creatively innocent.",
                "City Hall: Where dreams go to die in triplicate.",
                "I came to fight a parking ticket and left with three more.",
                "If bureaucracy was an Olympic sport, this place would win gold."
            }
        },

        -- Los Santos Customs zone configuration
        LSCustoms = {
            enabled = true,
            coords = vec3(-357.07, -134.6, 38.9),
            radius = 15,
            icon = 'fa-car',
            duration = 5000,
            randomThoughts = true,
            type = "persistent",
            thoughts = {
                "Time to turn my savings into vroom vroom noises!",
                "I came in for an oil change, left with a second mortgage.",
                "Who needs food when you can have a shiny new spoiler?",
                "My car's about to get an upgrade my wallet can't afford.",
                "LSCustoms: Where dreams come true and bank accounts go to die.",
                "I swear, this is the last modification... until next paycheck.",
                "My car's happiness is inversely proportional to my account balance.",
                "I'm not addicted to car mods, I can stop anytime... right after this nitrous install.",
                "LSCustoms: Turning 'I have money' into 'I had money' since 2013.",
                "I should've named my car 'College Fund' because that's where all the money went.",
                "My car's so modified, it's basically a transformer now.",
                "I'm not broke, I'm just... financially modified.",
                "LSCustoms: Because who needs retirement savings anyway?",
                "I came here to fix a scratch and left with a whole new car.",
                "My wallet screams 'no', but my need for speed screams 'YES!'"
            }
        },

        -- Legion Square Parking zone configuration
        LegionParking = {
            enabled = true,
            coords = vec3(212.88, -797.69, 30.87),
            radius = 20,
            icon = 'fa-parking',
            duration = 5000,
            randomThoughts = true,
            type = "persistent",
            thoughts = {
                "I gotta find a parking spot around here... in this vast sea of emptiness.",
                "Finally, a challenging parking experience! Said no one ever in this empty lot."
            }
        }
    }
}