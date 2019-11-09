with Ensembles_Chainage;
with Alea;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Nombre_Moyen_Tirages_Chainage is

    Minimum : Constant Integer := 1;     -- la borne inférieure de l'intervalle
    Maximum : Constant Integer := 100;   -- la borne supérieure de l'intervalle
    Passage : Constant Integer := Maximum - Minimum + 1;  -- le nombre d'éléments de l'intervalle

    -- générateur de nombres aléatoires dans l'intervalle
    package Mon_Alea is
            new Alea (Minimum,Maximum);
    use Mon_Alea;

    -- instanciation du packetage Ensembles_Chainage
    package Ensemble_Entiers is
            new Ensembles_Chainage (T_Element => Integer);
    use Ensemble_Entiers;

    Nombre_alea : Integer;            -- un nombre aléatoire
    Somme : Float;                    -- la nombre total de tirages
    Ensemble : T_Ensemble;            -- l'intervalle à remplir
    Nombre_moyen_tirages: Float;      -- le nombre moyen de tirages

begin
    Somme := 0.0;
    for i in 1..100 loop
            Initialiser(Ensemble);
            loop
                Get_Random_Number (Nombre_alea);
                if not Est_Present (Ensemble, Nombre_alea) then
                    Ajouter (Ensemble, Nombre_alea);
                else
                    null;
                end if;
                Somme := Somme + 1.0;
                exit when (Taille(Ensemble) = Passage);
            end loop;
	    Detruire (Ensemble);
        end loop;

    Nombre_moyen_tirages :=  Somme / 100.0;
    Put_Line ("Le nombre moyen de tirages qu'il faut faire pour obtenir tous les nombres de l'intervalle est :");
    Put (Nombre_moyen_tirages);

end Nombre_Moyen_Tirages_Chainage;

