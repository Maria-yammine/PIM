with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Integer_Text_IO;      use Ada.Integer_Text_IO;


--Gérer la commande à distance d'un drone avec son menu
procedure Drone is
	Choix: Character; 	--le choix de l'utilisateur lu au clavier
	Altitude: Integer;	--le choix de l'altitude voulue 
        Demarrer: Integer;	        --la saisie de la commande qui permet de démarrer le drone pour l'utiliser
        Quitter : boolean := True;	--Condition qui permettra de sortir de la boucle de répétition


begin 
    --Initialiser l'état du drone
    Altitude := 0;	
    Demarrer := 0;	
	
    loop
        Put("L'altitude courrante est : ");
        Put(Altitude,1);
        New_Line;
		
        --Afficher le menu 
	Put_Line("Que faire ?");
	Put_Line("d -- démarrer");
	Put_Line("m -- monter");
	Put_Line("s -- descendre");
	Put_Line("q -- quitter");

	--Demander son choix à l'utilisateur
	Put_Line("Quel est votre choix ? ");
	Get(Choix);
        Quitter := (Choix = 'q' or Choix = 'Q');

	--Traiter les différents choix de l'utilisateur 
        case Choix is
        when 'd' | 'D' =>   -- L'utilisateur choisit de démarrer le drone
            Demarrer := 1;	--Mise à jour de la valeur de Demarrer
			
        when 'm' | 'M' =>	    --L'utilsateur chosiit de monter
            if Demarrer = 0 then
                Put_line ("Le drone s'éteint"); --Le drone ne peut être commandé s'il n'est pas démarré
            else
                if Altitude = 4 then					--Le drone ne peut dépasser
                    Altitude := 5;						--5 en altitude
                    Put_line ("Le drone est hors de portée");		--sinon il est hors de portée
		else 
                    Altitude := Altitude + 1;
                end if;
				  
            end if;

        when 's' | 'S' =>   --L'utilisateur choisit de descendre	
            if Demarrer = 0 then	
                Put_line ("Le drone s'éteint");		--Le drone ne peut être commandé s'il n'est pas démarré
            end if;
            if Altitude = 0 then
                Put_line ("Cette action est impossible à réaliser"); --L'altitude du drone ne peut pas être négative
            else
                Altitude := Altitude - 1;		
            end if;

	when 'q' | 'Q' =>    --L'utilisateur décide de quitter le menu	
		Put_line ("Aurevoir");

	when others => null;
	end case;
	exit when Quitter;    --Condition de sortie de la boucle Répéter
    end loop;

end Drone;
