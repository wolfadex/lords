module God exposing (Error(..), God, create, view)

import Element exposing (..)
import List.NonEmpty exposing (NonEmptyList)


type God
    = God Model


type alias Model =
    { name : String
    , description : String
    }


type Error
    = NameRequired
    | DescriptionRequired


create : { a | name : String, description : String } -> Result Error God
create { name, description } =
    if String.isEmpty name then
        Err NameRequired

    else if String.isEmpty description then
        Err DescriptionRequired

    else
        Ok (God { name = name, description = description })


view : God -> Element msg
view (God { name, description }) =
    column
        [ spacing 8 ]
        [ "Kingdom of "
            ++ name
            |> text
        , paragraph [] [ text description ]
        ]


gods : NonEmptyList God
gods =
    List.NonEmpty.fromPair
        ( God { name = "Abholos, Devourer in the Mist", description = "A grey festering blob of infinite malevolence, described as the lesser brother of Tsathoggua or spawn of Cthulhu, born from his bile and tears." }
        , [ God { name = "Alala, Herald of S'glhuo", description = "An entity of living sound native to the Gulf of S'glhuo, and manifesting as a huge monstrous being. He is served by the Denizens of S'glhuo, which are made of his same substance." }
          , God { name = "Ammutseba, Devourer of Stars", description = "A dark cloudy mass, with tentacles, absorbing falling stars." }
          , God { name = "Amon-Gorloth, Creator of the Nile and Universe's Equilibrium", description = "A gigantic mysterious entity whose cult is perhaps coincident with that of Egyptian God Amun. Once dwelling in a gigantic palace known as Gz-eh near the Valley of the Kings, his dreaming force was able to shape reality. Causing life to eventually flourish within the Nile Valley, over 3,000 years ago, before the stars ceased to be right, and the advancing desert entombed his titanic body beneath the sands. Priests of his cult have built up secret subterranean mausoleums to access the Great Old One's body, and please the slumbering god by giving cattle as sacrificial victims." }
          , God { name = "Aphoom-Zhah, The Cold Flame, Lord of the Pole", description = "Appears much like Cthugha, but grey and cold." }
          , God { name = "Apocolothoth, The Moon God", description = "Lunar entity that dwells in the Dimension of Enno-Lunn." }
          , God { name = "Arwassa, The Silent Shouter on the Hill", description = "A humanoid-torso with tentacles instead of limbs, and a short neck ending in a toothless, featureless mouth." }
          , God { name = "Atlach-Nacha, The Spider God, Spinner in Darkness", description = "A giant spider with a human-like face." }
          , God { name = "Ayi'ig, The Serpent Goddess, Aeg, Aega", description = "Daughter of both Yig and the Outer Goddess Yidhra, appearing as a gigantic octopus-like horror with serpentine eyes, and detachable tentacles, which may move independently. She dwells within the cavern of a deep canyon somewhere in Texas." }
          , God { name = "Aylith, The Widow in the Woods, The Many-Mother", description = "A tall, shadowy humanoid figure with yellow glowing eyes, and strange protrusions like the branches of dead trees. She is a servant of Shub-Niggurath." }
          , God { name = "Baoht Z'uqqa-Mogg, The Bringer of Pestilence", description = "A huge, flying scorpion with an ant-like head." }
          , God { name = "Basatan, Master of the Crabs", description = "Not described, possibly a humanoid crustacean or a gigantic crab." }
          , God { name = "B'gnu-Thun, The Soul-Chilling Ice-God", description = "Appears as a cyanotic humanoid, followed by an eerie blizzard." }
          , God { name = "Bokrug, The Great Water Lizard, The Doom of Sarnath", description = "Appears as a gigantic water lizard." }
          , God { name = "Bugg-Shash, The Black One, The Filler of Space, He Who Comes in the Dark", description = "Appears as a black slimy mass covered in eyes and mouths, much like a Shoggoth." }
          , God { name = "Byagoona, The Faceless Ones", description = "Revered as a god of the dead and reanimated the deceased to sustain itself on their life force. Theorized to be an avatar of Nyarlathotep, though this is not confirmed." }
          , God { name = "Byatis, The Berkeley Toad, Serpent-Bearded Byatis", description = "Appears as a gigantic multicolored toad with one eye, a proboscis, crab-like claws, and tentacles below the mouth." }
          , God { name = "Chaugnar Faugn, The Horror from the Hills, The Feeder, Caug-Narfagn", description = "A vampiric elephant-like humanoid, with a mouth on the end of its trunk." }
          , God { name = "Coatlicue, Serpent Skirted One", description = "Appears as a gigantic reptilian humanoid with two facing snakes in place of an actual head, as depicted in the Coatlicue statue. She was the former mate of Yig, revered in K'n-yan along with her consort." }
          , God { name = "The Color, The Colour Out of Space", description = "Appears as an mutagenic, glowing, foul-smelling mist or fluid that mutates all organisms around it while slowly consuming their life-force." }
          , God { name = "Coinchenn", description = "A marine tentacled horror made of fish, whale, and octopus-like features." }
          , God { name = "Crom Cruach, Master of the Runes, Bloody Crooked One", description = "Not described, but likely something gigantic and serpent or worm-like." }
          , God { name = "Cthaat, The Dark Water God", description = "A formless mass of shape-shifting water." }
          , God { name = "Cthaeghya", description = "(Half-)sister of Cthulhu, which spawned the Star-Spawn of Cthulhu." }
          , God { name = "Cthugha, The Living Flame, The Burning One", description = "Appears as a living conflagration." }
          , God { name = "Cthulhu, Master of R'lyeh, The Great Dreamer", description = "A massive hybrid of human, octopus, and dragon. He is usually depicted as being hundreds of meters tall, with webbed arms, tentacles, and a pair of rudimentary wings on his back." }
          , God { name = "Cthylla, Secret Daughter of Cthulhu", description = "Appears as a huge winged octopus-like creature with six eyes. Youngest of Cthulhu and Idh-yaa's progeny." }
          , God { name = "Ctoggha, The Dream-Daemon", description = "No description available." }
          , God { name = "Cyäegha, The Destroying Eye, The Waiting Dark", description = "Appears as a gigantic black mass of tentacles, with a single green eye at the center." }
          , God { name = "Cynothoglys, The Mortician God, She Whose Hand Embalms", description = "Appears as a formless mound, with one arm-like appendage." }
          , God { name = "Dhumin, The Burrower from the Bluff", description = "A serpentine (likely Tremors-like) earth-shaking horror dwelling in the subsoil of Memphis, US." }
          , God { name = "Dygra, The Stone-Thing", description = "A jewel-facetted, semi-crystalline geode with mineral tentacles." }
          , God { name = "Dythalla, Lord of Lizards", description = "A gigantic saurian creature similar to Bokrug, but terrestrial, and endowed with a mane of tentacles." }
          , God { name = "Dzéwà, The White God", description = "A ravenous plant-god who arrived from Xiclotl to Earth, awed by the Insects from Shaggai. He appears as a white orb hiding an enormous magenta excrescence, like an orchid or a lamprey-like mouth, with emerald tentacles, tipped with hands emerging from within the hideous mass." }
          , God { name = "Eihort, The Pale Beast, God of the Labyrinth", description = "Appears as a huge, pallid, gelatinous oval with a myriad of legs and multiple eyes." }
          , God { name = "Ei'lor, The Star-Seed, The Plant-God", description = "A plant-like parasitic horror native to the jungle planet Kr’llyand, which orbits a dead, green star." }
          , God { name = "Etepsed Egnis", description = "A formless monstrosity with a huge, arm-like appendage." }
          , God { name = "Ghadamon, A Seed of Azathoth", description = "A bluish-brown, slimy monstrosity riddled with holes, and an occasional malformed head." }
          , God { name = "Ghatanothoa, Lord of the Volcano, Thoa", description = "Appears as a colossal horror with multifarious appendages, and Gorgon-like powers." }
          , God { name = "Ghisguth, The Sound of Deep Waters", description = "A titanic mass of jelly-like material." }
          , God { name = "Gi-Hoveg, The Aether Anemone", description = "A cosmic-entity manifesting as a gigantic, spongy, and fleshy mass covered in a myriad of both eyes and spines. He is said to be the nemesis of the Outer God Uvhash, usually summoned to contrast this deity." }
          , God { name = "Gla'aki, The Inhabitant of the Lake, Lord of Dead Dreams", description = "Appears as a giant three-eyed slug with metallic spines, and tiny pyramid-like feet underneath." }
          , God { name = "Gleeth, The Blind God of the Moon", description = "An eyeless and deaf Lunar deity worshiped in the ancient continent of Theem'dra, as well as in the Dreamlands, often mentioned as similar to Mnomquah, though apparently not related to each other." }
          , God { name = "Gloon, The Corrupter of Flesh, Master of the Temple, Glhuun", description = "Usually manifests through a Dionysian sculpture, but its true form is that of a gigantic wattled slug-thing." }
          , God { name = "Gobogeg, The Twice-Invoked", description = "Appears as a colossal pillar of amorphous alien flesh, with a cyclopean head. It drags up the continent it is summoned in, and causes the entire world to suddenly cave-in on itself." }
          , God { name = "God of the Red Flux", description = "A vaporous red entity haunting the rainforest of Central Africa. It has the power to turn humans into zombie-like servants, the Tree-Men of M'bwa." }
          , God { name = "Gog-Hoor, Eater of the Insane", description = "A gigantic entity dwelling in some reverse dimension, resembling a huge bullet with a long proboscis." }
          , God { name = "Gol-goroth, Golgoroth, The Forgotten Old One, God of the Black Stone, Golgoroð", description = "Appears as a gigantic, black, toad-like creature with an impossibly malevolent glare, or a tentacled, scaled, bat-winged entity." }
          , God { name = "Golothess", description = "An entity cut in ten pieces by Yig during a time of great battle (one of these pieces is an alabaster dish found in Egypt, dated back 1,300 BC). It resembles and has a similar domain as the Greek god Dionysus." }
          , God { name = "The Green God, The Horror Under Warrendown", description = "A sentient plant-like entity dwelling within a series of caverns, where it is always served by mutant rabbit-like worshipers." }
          , God { name = "Groth-Golka, The Demon Bird-God, The Bird-God of Balsagoð", description = "A monstrous bird-like fiend with sharp teeth, dwelling beneath Antarctica, vaguely resembling an extinct pterosaur." }
          , God { name = "Gtuhanai, The Destroyer God of the Aartnna", description = """A destructive entity manifesting as a ravenous metallic vortex. He seems to be another half-brother of Cthulhu, like Hastur, and related to the slug-like Glaaki as well. He has also been called a "son of Yog-Sothoth". Whether these titles are literal or conceal some dark truth about the Destroyer, none can ascertain. He dwells somewhere in the Pleiades stellar region, and when summoned, he brings devastation.""" }
          , God { name = "Gurathnaka, Eater of Dreams, Shadow of the Night", description = "A shadowy incorporeal entity dwelling in the Dreamlands." }
          , God { name = "Gur'la-ya, Lurker in the Doom-laden Shadows", description = "A great shadow thing, with two glaring red eyes, able to transform the skull of its victims into green glowing stones carved with strange symbols." }
          , God { name = "Gwarloth", description = "A tentacled amoebic horror with multiple eyes, orifices, and a dangling gland forming a hideous face." }
          , God { name = "Gzxtyos, Mate of Othuyeg", description = "The consort of Othuyeg, likely similar to her bridegroom." }
          , God { name = "Han, The Dark One", description = "A being made of cold, howling mist bound to Yig's worship." }
          , God { name = "Hastalÿk, The Contagion", description = "A microbial entity, responsible for plagues." }
          , God { name = "Hastur, The Unspeakable, He Who is Not to be Named, Lord of Interstellar Spaces,  The King in Yellow, The Peacock King, Zukala-Koth", description = "His true form is unknown, but usually manifests either as a polypous, ravenous floating mass endowed with tentacles, drills, and suckers, or more frequently, as the King in Yellow, a humanoid being wearing tattered, yellow clothes and a mask hiding the face. He is said to be Cthulhu's (half-)brother. He is said to be of the air element opposed to Cthulhu's water element." }
          , God { name = "H'chtelegoth, The Great Tentacled God", description = """A towering greenish trunk with a "crown" of tentacles, a row of multiple eyes, and a series of additional lateral grasping appendages.""" }
          , God { name = "Haiogh-Yai, The Outsider", description = "a monstrous, amorphous, whirling entity living within a wandering black hole called Vix’ni-Aldru, which also hosts a city made of titanic blocks, inhabited by mysterious creatures resembling either worms or lizards." }
          , God { name = "Hnarqu, The Great One", description = "Lesser brother of Cthulhu, manifesting as a gigantic mouth surrounded by countless tentacles, similar to a titanic sea anemone." }
          , God { name = "Hziulquoigmnzhah, The God of Cykranosh, Ziulquag-Manzah", description = "Has a spheroid body, elongated arms, short legs, and a pendulum-like head dangling underneath. He is the brother of Ghisguth, and uncle of Tsathoggua." }
          , God { name = "Idh-yaa, Cthulhu's Mate, Xothic Matriarch", description = "A gigantic, pale, worm-like horror dwelling beneath the crust of the star Xoth. She has been Cthulhu's first bride, and with him spawned three sons—Ghatanothoa, Ythogtha, and Zoth-Ommog—and a younger daughter, Cthylla." }
          , God { name = "Inpesca, The Sea Horror", description = "A formless expansive bluish-black mass, haunting both the Ecuadorian and Peruvian coasts, mentioned in Cthäat Aquadingen as inimical to the Deep Ones." }
          , God { name = "Iod, The Shining Hunter", description = "A levitating, sinuous glowing creature." }
          , God { name = "Istasha, Mistress of Darkness", description = "A cat-like deity, similar to Bastet, but vicious and malignant. Her sister is the sylvan Lythalia." }
          , God { name = "Ithaqua, The Wind Walker, The Wendigo, God of the Cold White Silence", description = "A gigantic, corpse-like human, with webbed feet and glowing red eyes." }
          , God { name = "Janai'ngo, Guardian and the Key of the Watery Gates, The Lobster of the Deep", description = "A crustacean-like, tentacled, half-amorphous marine horror which serves Cthulhu, dwelling in the depths of the Bay of Rhiiklu, somewhere within the eastern coast of the United States." }
          , God { name = "Juk-Shabb, God of Yekub", description = "Appears as a great shining ball of energy." }
          , God { name = "Kaalut, The Ravenous One", description = "Likely a gigantic larva-like horror, dwelling in the nebulous realm of K'gil'mnon, along with the Gharoides, its parasitic insectoid servants." }
          , God { name = "Kag'Naru of the Air", description = "Mentioned in the American comic book Challengers of the Unknown #81-87 (1977) as the sister of M'Nagalah." }
          , God { name = "Kassogtha, Bride of Cthulhu, The Leviathan of Diseases", description = "A huge mass of coiled, writhing tentacles. She is Cthulhu's sister and mate, who bore him the twin daughters Nctosa and Nctolhu." }
          , God { name = "Kaunuzoth, The Great One, Cannoosut", description = "A squat, sea cucumber-like monstrosity with five eyes, three-toed, taloned appendages, and a large mouth. He is described as one of Glaaki’s brethren, and dwells within the Moore Reservoir of Vermont, in the United States." }
          , God { name = "Khal'kru, All-in-All, Greater-than-Gods", description = "A dark octopoid horror, similar to the Norse Kraken, but dwelling inside a temple somewhere within a hidden warm valley in Alaska." }
          , God { name = "Klosmiebhyx", description = "Sister of Zstylzhemghi." }
          , God { name = "K'nar'st, Spawn of the Forgotten", description = "An amphibious humanoid with four, seven-clawed arms, and tentacles in place of legs. The head is lion-like, but bony and his mouth encases three long tongues. He lies trapped beneath the seafloor, inside a mysterious seamount called Nayghof." }
          , God { name = "Krang, The Dead One", description = "A monstrous, brown, leathery, alien entity native to a mysterious planet, currently slumbering within a gigantic mausoleum lost in the desert-wastes, set to guard a priceless treasure made up of the oldest decayed planets." }
          , God { name = "Kthaw'keth, The Supreme Unknown, Scourge of Yaksh", description = "A six-eyed, crocodile-snouted monstrosity covered with both tentacles and tripod-like limbs. Revered by the ancient Egyptians as the deification of both darkness and chaos." }
          , God { name = "Kurpannga, The Devil-dingo", description = "A giant hairless dingo-like fiend living in the Dreamlands (or the Dreamtime of Aboriginal myths)." }
          , God { name = "Lam, The Grey", description = "An alien entity, similar to Grey aliens, dwelling in the dark side of the planet Mars." }
          , God { name = "Lexur'iga-serr'roth, He Who Devours All in the Dark", description = "A photophobic bat-winged monstrosity, with both a thousand-eyed misshapen head and huge maws." }
          , God { name = "Lythalia, The Forest-Goddess", description = "A female seductive humanoid-entity, covered in both vines and vegetal parts. Somehow, she has been the mate of the Elder God Nodens, bearing him the twin gods Vorvadoss and Yaggdytha. The feline Istasha is the sister of Lythalia." }
          , God { name = "Mappo no Ryujin, Harbinger of Doom, Mappo's Dragon", description = "A dragon-like entity, covered in pseudopods, regarded as the mother of the Snake-God Yig and said to be imprisoned beneath the sunken continent of Mu." }
          , God { name = "M'basui Gwandu, The River Abomination", description = "A spider-eyed bat-winged horror lurking within the Congo River." }
          , God { name = "M'Nagalah, The Devourer, The Cancer God, The Eternal", description = "A mass of both entrails and eyes, or a massive blob-thing." }
          , God { name = "Mnomquah, Lord of the Black Lake, The Monster in the Moon", description = """A very large and eyeless lizard-like creature with a "crown" of feelers.""" }
          , God { name = "Mordiggian, The Charnel God, The Great Ghoul, Lord of Zul-Bha-Sair, Morddoth", description = "A shape-shifting cloud of darkness." }
          , God { name = "Mormo, The Thousand-Faced Moon", description = "Mormo appears in many forms, but three are most common: as a mocking vampiric maiden, as a tentacle-haired gorgon, or as a hunched toad-like albino with a mass of feelers instead of a face. This last form is the appearance of her servitors, the Moon-beasts." }
          , God { name = "Mortllgh, Storm of Steel", description = "A lustrous orb floating at the center of a whirling vortex of razor-sharp, metallic-looking blades." }
          , God { name = "Mynoghra, She-Daemon of the Shadows", description = "A succubus-like fiend with alien traits, and tentacles in place of hair. She is mentioned as a cousin of Nyarlathotep in the O’ Khymer Revelations, and worshiped by witch cults in Salem, Oregon." }
          , God { name = "Nctosa & Nctolhu, The Twin Spawn of Cthulhu", description = """Twin daughters of Cthulhu, imprisoned in the Great Red Spot of the planet Jupiter. They both appear as huge shell-endowed beings, with eight segmented limbs, and six long arms ending with claws, vaguely resembling their "half-sister" Cthylla.""" }
          , God { name = "Ngirrth'lu, The Wolf-Thing, The Stalker in the Snows, He Who Hunts, Na-girt-a-lu", description = "A ferocious and towering wolf-like humanoid with bat wings. He is served by werewolf servants known as the Lupine Ones." }
          , God { name = "Northot, The Forgotten God, The Thing That Should Not Be", description = "A mysterious entity related to Yog-Sothoth, Shub-Niggurath, and possibly Azathoth as well which manifests either as a faun-like humanoid with color-changing hair, or as a glowing halo of unknown color." }
          , God { name = "Nssu-Ghahnb, The Heart of the Ages, Leech of the Aeons", description = "A sort of gigantic pulsating heart secluded in a parallel dimensions. It is responsible for spawning all of the various monsters which exist within the known Universe." }
          , God { name = "Nug and Yeb, The Twin Blasphemies", description = "Two horrid nebulous masses of shape-changing vapor from which eyes, tentacles, maws, and hooves emerge; somewhat like Shub-Niggurath. They have been spawned by Yog-Sothoth, and both (or either) are regarded as the blasphemous parents of Cthulhu." }
          , God { name = "Nyaghoggua, The Kraken Within", description = "A blurry, dark, kraken-like entity mentioned in the Song of Yste, and said to dwell in Outer Space." }
          , God { name = "Nycrama, The Zombifying Essence", description = "A tall larva-like monstrosity, with hundreds of segmented taloned tendrils, exiled by the Elder Gods into a parallel dimension, with close connections to the rainforests of South America, where he lures human victims to enslave from other dimensions. Formerly, he was too an Elder God." }
          , God { name = "Nyogtha, The Thing which Should Not Be, Haunter of the Red Abyss", description = "Appears as an inky cloud of shadows." }
          , God { name = "Ob'mbu, The Shatterer", description = "A giraffe-like reptilian monster." }
          , God { name = "Oorn, Mnomquah's Mate", description = "Appears as a huge, tentacled mollusk." }
          , God { name = "Othuum, The Oceanic Horror", description = "A twisting tentacled mass, with a single alien face somewhere in the center of the slimy squirming mass." }
          , God { name = "Othuyeg, The Doom-Walker", description = "Appears as a great tentacled eye similar to Cyäegha, but much more similar to the monster featured in the horror movie The Crawling Eye. He currently dwells within the subsoil of Kansas, in the fabled Seven Cities of Gold." }
          , God { name = "Perse", description = "A maddening, twisted-minded, alien entity appearing as a feminine figure in a red cloak, with three eyes, and an utterly alien face. Likely coincident with Classical Underworld goddess Persephone, she manifest aboard a ghost ship and contact traumatized humans, with hidden artistic talent, to spread both chaos and despair across the world." }
          , God { name = "Pharol, Pharol the Black", description = """A black, fanged, cycloptic demon with arms like swaying serpents. The entity normally dwells in another dimension—a "seething and sub-dimensional chaos" beyond the mundane universe. The wizard Eibon of Hyperborea sometimes summoned Pharol to query him for arcane information.""" }
          , God { name = "Poseidon", description = "A powerful extragalactic entity, awed by ‘Ymnar. It battled against the Elder God Paighon." }
          , God { name = "Psuchawrl, The Elder One", description = "A tall humanoid with an eyeless sea anemone-like face, and a beaked grinning mouth, who can be summoned like a jinn." }
          , God { name = "Ptar-Axtlan, The Leopard That Stalks the Night", description = "A mysterious entity related to zoomorphic shapeshifters, especially were-cats." }
          , God { name = "Quachil Uttaus, Treader of the Dust", description = "Appears as a miniature, wrinkled mummy with stiff, outstretched claws." }
          , God { name = "Quyagen, The Eye of Z'ylsm, He Who Dwells Beneath Our Feet", description = "Worshiped as a deity in a lost continent located in the southern Atlantic Ocean. He appears related to Nyarlathotep, and his form is likely octopoid, with myriads of horns along a maddening body." }
          , God { name = "Q'yth-az, The Crystalloid Intellect", description = "A towering mass of crystals, residing on the lightless planet Mthura." }
          , God { name = "Raandaii-B'nk", description = "A shark-like humanoid native to the Bermuda Triangle, possibly similar to Cthulhu's avatar the Father of All Sharks." }
          , God { name = "Ragnalla, Seeker in the Skies", description = "A titanic raptorial fiend with a huge, single eye and a crown of tentacles." }
          , God { name = "Raphanasuan, The One from the Sun Race", description = "A gigantic and likely multi-armed fiend." }
          , God { name = "Rhagorthua, Father of All Winds", description = "A fiery entity similar to Cthugha, able to absorb nuclear radiation, and imprisoned somewhere within the subsoil of New Mexico." }
          , God { name = "Rhan-Tegoth, Terror of the Hominids, He of the Ivory Throne", description = "A three-eyed, gilled, proboscidian monster with a globular torso, six, long sinuous limbs ending in black paws, with crab-like claws, and covered in what appears to be hair, but is actually tiny tentacles." }
          , God { name = "Rhogog, The Bearer of the Cup of the Blood of the Ancients", description = "A black leafless oak tree, hot to the touch and with a single red eye at the center." }
          , God { name = "Rh'Thulla of the Wind", description = "Mentioned in the American comic book Challengers of the Unknown #81-87 (1977) as the brother of M'Nagalah." }
          , God { name = "Rlim Shaikorth, The White Worm", description = "A gigantic, whitish worm with a huge maw and hollow eyes made of dripping globules of blood." }
          , God { name = "Rokon", description = "A mysterious extra-dimensional entity, regarded as the brother of Yig, ruling over a dimension called Zandanua." }
          , God { name = "Saaitii, The Hog", description = "A gigantic, ghostly hog." }
          , God { name = "Scathach", description = "One of Hziulquoigmnzhah's children, supposedly female." }
          , God { name = "Sebek, The Crocodile God", description = "A crocodile-headed reptilian humanoid, equal to the Ancient Egyptian god Sobek." }
          , God { name = "Sedmelluq, The Great Manipulator, Ishmagon", description = "A colossal glowing worm, with a starfish-shaped head, dwelling in Antarctica and served by the Mi-go." }
          , God { name = "Sfatlicllp, The Fallen Wisdom", description = "The granddaughter of Tsathoggua, an amorphous mass which mated with a Hyperborean Voormi and spawned the legendary thief Knygathin Zhaum. In Chaosium's Dead Leaves Fall RPG supplement, she appears as a fiend with oily snakes skin, and prehensile dreadlocks like a Gorgon." }
          , God { name = "Shaklatal, The Eye of Wicked Sight", description = "A dark-skinned humanoid horror with tentacles sprouting from his head, and glowing red eyes, worshiped by the earliest African civilizations as the god Amun. He is said to be rival of Cthulhu." }
          , God { name = "Shathak, Mistress of the Abyssal Slime, Death Reborn, Zishaik, Chushaik", description = "Not described, likely an amorphous mass." }
          , God { name = "Shaurash-Ho", description = "Mysterious entity mentioned in Howard Phillips Lovecraft's letter to James F. Morton as a descendant of Cthulhu which spawned other two horrid descendants (K'baa the Serpent and Ghoth the Burrower). The latter would have sired with a Roman noblewoman Viburnia the legendary ancestor of Lovecraft himself in a fictional family tree. The appearance of Shaurash-Ho has never been described." }
          , God { name = "Sheb-Teth, Devourer of Souls", description = "An eyeless alien humanoid entity, massively overgrown with both strange flesh and machinery." }
          , God { name = "Shista, God of Fidelity", description = "A shape-shifting entity, often manifesting as a spiny five-legged crab, with a spider-like head and metallic bracelets on each limb." }
          , God { name = "Shlithneth", description = "A gigantic slimy worm, with a mass of black tentacles surrounding its maw." }
          , God { name = "Sho-Gath, The God in the Box, The Big Black Thing", description = "A dark smoky column, with red malevolent eyes and a grotesque face, imprisoned inside a vintage box." }
          , God { name = "Shterot, The Tenebrous One", description = "A starfish-like horror spawned by the Outer God C'thalpa. It has been cut into pieces, but individual fragments live independently." }
          , God { name = "Shudde M'ell, The Burrower Beneath, The Great Chthonian", description = "Appears as a colossal worm with tentacles for a head." }
          , God { name = "Shuy-Nihl, The Devourer in the Earth", description = "A dark blob of darkness endowed with tentacles." }
          , God { name = "Sthanee, The Lost One", description = """A gigantic marine horror with twelve snaky-limbs, endowed with suckers, and a beard of tentacles, both served and revered by vicious merfolk, known as the "Children of Sthanee".""" }
          , God { name = "S'tya-Yg'Nalle, The Whiteness", description = "An invisible entity made of both snow and chill, servitor of Ithaqua." }
          , God { name = "Summanus, Monarch of the Night, The Terror that Walketh in Darkness", description = "A mouthless, grotesque humanoid with pale tentacles protruding from underneath a dark robe." }
          , God { name = "Swarog", description = "A hideous being appearing as a dark, gigantic, legless bird-like horror swathed in dark flames, with its long neck topped by a black lump, half of which endowed with a big glowing eye and the other being covered in innumerable tentacles. It was revered by Slavic and Viking folks as the Solar god Svarog, though sharing almost nothing with the traditional deity." }
          , God { name = "Thanaroa, The Shining One", description = "A mysterious evil entity, manifesting as a pillar of dazzling light, dwelling in the ruins of Nan Madol, near Ponape. Its name recalls that of Polynesian creator god Tangaroa." }
          , God { name = "Tharapithia, The Shadow in the Crimson Light", description = "Slavic and Ugric God-like creature, photophobic and burrowing fiend awed in the Middle Ages. It cannot endure sunlight, and eludes it by tunneling deep underneath the roots of oak trees." }
          , God { name = "Thasaidon, Master of the Endless Void", description = "A malignant entity manifesting as a mace-wielding armored warrior. He is revered as the Principle of Evil in Zothique, but his cult dates back to the time of Mu." }
          , God { name = "T'ith, --", description = "The offspring of Cthulhu and the Elder God Sk'tai." }
          , God { name = "Thog, The Demon-God of Xuthal", description = "An octopoid monster of Hyborian Age, which haunts the underground city of Xuthal." }
          , God { name = "Toth, −", description = "A colossal, burrowing arthropod-like horror." }
          , God { name = "Th'rygh, The God-Beast", description = "A monstrous entity manifesting as a horrible patchwork of flesh, soil, and alien matter." }
          , God { name = "Tsathoggua, The Sleeper of N'kai, The Toad-God, Zhothaqqua, Sadagowah", description = "Appears as a huge, furry, almost humanoid toad, or a bat-like sloth." }
          , God { name = "Tulushuggua, The Watery Dweller Beneath", description = "A mysterious subterranean horror, dwelling deep within the flooded caves of Florida, served by the eel-like horrors known as the Tulush." }
          , God { name = "Turua, Father of the Swamps, The Bayou Plant God", description = "A fungine entity with both tentacles and tendrils, which haunts the swamplands of Florida, somehow similar to The Green God." }
          , God { name = "Uitzilcapac, Lord of Pain", description = "A sadistic entity trapped by the Elder Gods in a remote dimension of the Space-Time continuum, and appearing as a 4-m tall lizard-like horror with six legs, and a mouth filled with vicious fangs." }
          , God { name = "Ut'Ulls-Hr'Her, The Great Horned Mother, Black Glory of Creation", description = "A huge faceless creature with various appendages sprouting from its head, a beard of oozing horns, many reddish teats, and fish-like fins sprouting from an egg-shaped body." }
          , God { name = "Vhuzompha, Mother and Father to All Marine Life, The Hermaphroditic God", description = "An amorphous monster of prodigious size, covered in a multitude of eyes, mouths, projections, and both male and female genitalia." }
          , God { name = "Vibur, The Thing from Beyond", description = "A huge, furry, and rapidly shifting entity casting radioactive stones." }
          , God { name = "Vile-Oct", description = "A dragon-like or reptilian entity said to be familiar of Yig." }
          , God { name = "Volgna-Gath, Keeper of Secrets", description = "A slimy shape-shifting mass, which can be summoned with mud and the blood of the invoker." }
          , God { name = "Voltiyig, Yig's Terrifying Son", description = "Spawn of the Snake-God Yig, appearing as a winged and feathered serpent with flaming nostrils, somehow similar to the Aztec God Quetzalcoatl, trapped inside a dark tower topped with a giant five-pointed star." }
          , God { name = "Vthyarilops, The Starfish God", description = "A tentacled horror similar to a Sun Star, but endowed with branching tentacles, spines, myriads of blue glaring eyes, and gaping-maws." }
          , God { name = "Vulthoom, The Sleeper of Ravermos, Gsarthotegga", description = "May appear as a huge, unearthly plant." }
          , God { name = "The Worm that Gnaws in the Night, Doom of Shaggai", description = "A massive worm-like fiend similar to a Graboid from Tremors." }
          , God { name = "Xalafu, The Dread One", description = "A titanic, globular mass of various dark colors, endowed with a huge single-eye in the middle of the alien bulk." }
          , God { name = "Xcthol, The Goat God", description = "A sadistic, mind-controlling, faun-like humanoid, likely related to Shub-Niggurath." }
          , God { name = "Xinlurgash, The Ever-Consuming", description = "A bristly-mass with large gaping maws, made up with tentacles and spider-like limbs." }
          , God { name = "Xirdneth, Maker of Illusions, Lord of Unreality", description = "An illusion-making entity with no true form." }
          , God { name = "Xitalu, Being of Higher Dimension", description = "A tentacled, multi-eyed, soul-devouring abomination which dwells between dimensions." }
          , God { name = "Xotli, Lord of Terror, The Black Kraken of Atlantis, Demon-God of Elder Night", description = "A rolling cloud of ebony darkness or a vortex of boreal cold, revered by Atlanteans priests of the Hyborian Age." }
          , God { name = "Xoxiigghua", description = "A three-eyed, octopoid, and parasitic horror trapped inside a Central American mountain range." }
          , God { name = "Yamath, Yama", description = "Worshiped in ancient Lemuria. Aspect of the Triple God of Chaos. Known as Yama, king of demons, in Tibet." }
          , God { name = "Yegg-Ha, The Faceless One", description = "A 10-foot tall winged being which rules over the Nightgaunts, before being defeated in ancient Britain by a centuria of Roman soldiers." }
          , God { name = "Y'golonac, The Defiler", description = "Appears as a naked, obese, headless humanoid with a mouth in the palm of each hand; other features are nebulous." }
          , God { name = "Yhagni", description = """A hideous female or hermaphroditic entity of tremendous power, cousin of Cthulhu and Hastur, imprisoned by the Great Old Ones being themselves aware of her powers. She dwells within the "Temple of Pillars, " in the depths of Kyartholm located somewhere in the Northern Hemisphere. Her appearance is never described, but likely formless, larva-like, and tentacled as depicted in the minion-spawn which serve her parasitizing human victims.""" }
          , God { name = "Yhashtur, The Worm-God of the Lords of Thule", description = "A worm-like monster dwelling at Northern Polar latitudes, said to be the rival or inimical to Nyarlathotep." }
          , God { name = "Yig, Father of Serpents", description = "A giant snake with human-like arms covered in scales. Son of the Mappo's Dragon, children of his are Ayi'ig and Voltiyig, whereas Rokon is regarded as the brother of Yig." }
          , God { name = "Y'lla, Master of the Seas", description = "A monstrous, barrel-shaped sea worm with tentacles and a lamprey-like mouth." }
          , God { name = "'Ymnar, The Dark Stalker", description = "A shape-shifting entity spawned by the Outer God Ngyr-Korath to serve him only. It may grant great powers to whoever chooses to serve him and his master, but his final aim is the destruction of all sentient and intelligent life in the Cosmos." }
          , God { name = "Yog-Sapha, The Dweller of the Depths, Lord of the Things Which Dwell Beneath the Surface", description = "A gigantic, amoebic, glowing, and multihued gelatinous mass living within the dark depths of Earth." }
          , God { name = "Yorith, The Oldest Dreamer", description = "A huge crystalline-being residing in the seas of the ocean planet Yilla. Its hypnotic abilities force those spacefarers, who stray too closely, to suddenly plunge into the depths of its lethal sea." }
          , God { name = "Ysbaddaden, Chief of the Giants", description = "One of Hziulquoigmnzhah's children, supposedly male and gigantic." }
          , God { name = "Ythogtha, The Thing in the Pit", description = "Appears as a colossal Deep One, with tentacles surrounding its one eye." }
          , God { name = "Yug-Siturath, The All-Consuming Fog", description = "A vampiric vaporous entity which adsorbs vital forces." }
          , God { name = "Zathog, The Black Lord of Whirling Vortices", description = "A festering, bubbling mass that constantly churns and whirls, putting forth vestigial appendages and reabsorbing them. Bubbles burst on the surface to reveal hate-filled eyes, and slobbering mouths form or close randomly about his horrible body. He dwells in the Xentilx galaxy, served by the Zarrian aliens." }
          , God { name = "Zhar and Lloigor, The Twin Obscenities", description = """Both appear as a colossal mass of tentacles, trapped inside the "Plateau of Sung, " somewhere in Myanmar.""" }
          , God { name = "Zindarak, The Fiery Messenger", description = "A mysterious fiery entity, that shall release Cthulhu from his prison once the stars are right." }
          , God { name = "Zoth-Ommog, The Dweller in the Depths", description = "A gigantic entity with a cone-shaped body, a reptilian head, a beard of tentacles, and starfish-like arms." }
          , God { name = "Zstylzhemghi, Matriarch of Swarms, Zystulzhemgni", description = "Spawn of the Outer God Ycnàgnnisssz, described as a living alien swarm. She also has a sister named Klosmiebhyx." }
          , God { name = "Zushakon, Dark Silent One, Old Night, Zul-Che-Quon, Zuchequon", description = "Appears as a swirling, black vortex, revered by the Mutsune Native Americans as a dire death god. He is also worshiped by mysterious servitors known as the Hidden Ones." }
          , God { name = "Z'toggua", description = "An obese bat-winged humanoid with a long polypous snout and a wide mouth, opening in the belly, served by the Deep Ones." }
          , God { name = "Zvilpogghua, Feaster from the Stars, The Sky-Devil, Ossadagowah", description = "A bat-winged, armless toad with tentacles instead of a face." }
          , God { name = "Hagarg Ryonis, The Lier-in-Wai", description = "Usually appears as a huge, reptilian monster. " }
          , God { name = "Karakal", description = "An elf-like humanoid. " }
          , God { name = "Lobon", description = "Appears as ivy-crowned youth bearing a spear." }
          , God { name = "Nath-Horthath", description = "Chief god of Celephaïs." }
          , God { name = "Oukranos", description = "River god" }
          , God { name = "Tamash", description = "Appears as a short, silver-skinned, ebon-haired, and bearded man." }
          , God { name = "Zo-Kalar", description = "God of birth and death." }
          ]
        )
