--------------------------------------------------------------------------------
--  Auteur   : Maria-Estella YAMMINE 
--  Objectif : Réviser les tables de multiplication
--------------------------------------------------------------------------------

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Calendar;          use Ada.Calendar;
With Alea;

-- Aider l'utilisateur à réviser les tables de multiplication
procedure Multiplications is
    Table : Integer;			-- la table que souhaite réviser l'utilisateur
    Erreur, Bonne_rep : Integer;	-- le nombre d'erreurs et de bonnes réponses
    Temps_max : Duration;		-- le temps maximal mis pour répondre à une multiplication
    Nombre_alea : Integer; 		-- le nombre aléatoire choisi entre 1 et 10
    Reponse : Integer;			-- la réponse de l'utilisateur
    Debut : Time;			-- heure de début de l'opération
    Fin : Time;				-- heure de fin de l'opération
    Delai : Duration;			-- durée de l'opération
    Somme : Duration;			-- la somme des délais
    Table_a_rev : Integer; 		-- la table qui a demandé un maximum de temps de réponse
    Moyenne : Duration; 		-- la moyenne de la somme des délais
    Choix : Character;			-- le choix de l'utilisateur a la fin d'un test
    Arreter : Boolean; 			-- condition d'arrêt de la boucle répéter
   
    package Mon_Alea is
            new Alea (1,10);
    use Mon_Alea;
	    
begin
    loop 
	
	-- Demander à l'utilisateur de choisir la table qu'il souhaite réviser
	loop
	    Put("Table à réviser : ");
            Get (Table);
            Skip_Line;
            if (Table < 1 or Table > 10) then
                Put_Line ("La table choisie doit être entre 1 et 10");    -- on explique à l'utilisateur pourquoi on lui redemande une table à réviser
            else
                null;
            end if;
        exit when (Table >= 1 and Table <= 10);		 
        end loop;

	-- Réviser la table choisie
	Erreur := 0;				-- initialiser le nombre d'erreurs 
	Bonne_rep := 10 - Erreur;	        -- initialiser le nombre de bonnes réponses 
	Temps_max := 0.0;			-- initialiser le temps maximal
        
        for Multiplication in 1..10 loop
                
	    -- Choisir un nombre aléatoire entre 1 et 10
        Get_Random_Number (Nombre_alea);
	    New_Line;

	    -- Proposer la multiplication 
            Put("(M");
            Put(Multiplication,1);
            Put(") "); 
            Put(Table,1);
            Put(" * ");
            Put(Nombre_alea,1);
            Put_Line(" ?");
          
	    -- Saisir la réponse de la multiplication proposée
	    Somme := 0.0;		-- initialiser la somme des délais	
	    Debut := Clock;		-- récuperer l'heure de début
	    Put("Votre réponse : ");
	    Get (Reponse);
	    Fin := Clock; 		-- récuperer l'heure de fin
            Delai := Fin - Debut; 	-- calculer le delai de réponse
            New_Line; 

	   -- Dire si la réponse saisie est bonne ou mauvaise
	   if (Reponse = Table * Nombre_alea) then
	       Put_Line("Bravo !");
               New_Line;
	   else 
	       Put_Line("Mauvaise réponse");
               Erreur := Erreur + 1;
               Bonne_rep := Bonne_rep - 1;
               New_Line;
	   end if;

            -- Conseiller à l'utilisateur la table qui a demandé un maximum de temps de réponse
           Somme := (Somme + Delai);	  -- sommer les délais de réponse
           if (Temps_max < Delai) then
	       Temps_max := Delai;
	       Table_a_rev := Nombre_alea;
	   else 
	       null;
	   end if;
        end loop; 

	-- Afficher un message en fonction du nombre d'erreurs commises
	case Erreur is
        when 0	        =>	Put_Line ("Aucune erreur. Excellent !");
            New_Line;
        when 1	        => 	Put_Line ("Une seule erreur. Très bien.");
            New_Line;
        when 10	        => 	Put_Line ("Tout est faux ! Volontaire ?");
            New_Line;
        when 2..5  	=> 	Put (Erreur, 1);
            Put(" erreurs. Il faut encore travailler la table de");
            Put_Line(Integer'Image(Table));
            New_Line;
        when 6..9 	=> 	Put("Seulement ");
            Put (Bonne_rep,1);
            Put (" bonnes réponses. Il faut apprendre la table de");
            Put_Line(Integer'Image(Table));
            New_Line;
        when others =>
            pragma Assert (False);
	end case;

	--Conseiller une table à revoir
	Moyenne := Somme / 10.0;		-- calculer la moyenne de la somme des délais
	if (Temps_max > Moyenne) then
            Put("Des hésitations sur la table de ");
            Put(Table_a_rev,1);
            Put(" :");
            Put(Duration'Image(Temps_max));
            Put(" secondes contre");
            Put(Duration'Image(Moyenne));
            Put_Line(" en moyenne. Il faut certainement la réviser.");
            New_Line;
	else
	    null;
	end if;

	-- Demander à l'utilisateur s'il veut continuer ou s'arrêter
	Put ("Voulez-vous continuer à vous entraîner o/n ? ");
	Get(Choix);
        Arreter := (Choix = 'n' or Choix = 'N');
            
        exit when Arreter;
    end loop;

end Multiplications;
