with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

-- Objectif : Afficher un tableau trié suivant le principe du tri par sélection.

procedure Tri_Selection is

    CAPACITE: constant Integer := 10;   -- la capacité du tableau

    type Tableau_Entier is array (1..CAPACITE) of Integer;

    type Tableau is
        record
            Elements : Tableau_Entier;
            Taille   : Integer;         --{ Taille in [0..CAPACITE] }
        end record;


    -- Objectif : Afficher le tableau Tab.
    -- Paramètres :
    --     Tab : le tableau à afficher
    -- Nécessite : ---
    -- Assure : Le tableau est affiché.
    procedure Afficher (Tab : in Tableau) is
    begin
        Put ("[");
        if Tab.Taille > 0 then
            -- Afficher le premier élément
            Put (Tab.Elements (1), 1);

            -- Afficher les autres éléments
            for Indice in 2..Tab.Taille loop
                Put (", ");
                Put (Tab.Elements (Indice), 1);
            end loop;
        end if;
        Put ("]");
    end Afficher;

    function Min_Index_Tableau (T : Tableau_Entier; Index_debut, Taille : in Integer) return Integer is
        Rang : Integer := Index_debut;
        Minimum : Integer := T(Index_debut);
    begin
        for i in Index_debut..Taille loop
            if T(i) < Minimum then
                Minimum := T(i);
		Rang := i;
	    end if;
	end loop;
	return Rang;
    end Min_Index_Tableau;

    procedure Permuter (T : in out Tableau_Entier; Index1, Index2 : in Integer) is 
	Index_temp : Integer;
    begin
	if Index1 /= Index2 then
	    Index_temp := T(Index1);
	    T(Index1) := T(Index2);
	    T(Index2) := Index_temp;
	end if;
    end Permuter;

    function Tri_Tableau (Tab : in out Tableau) return Tableau is
    begin
	for i in 1..CAPACITE loop
	   Permuter (Tab.Elements, i, Min_Index_Tableau(Tab.Elements, i, Tab.Taille));
	end loop;
	return Tab;
    end Tri_Tableau;


    Tab1, Tab2, Tab3, Trie1, Trie2, Trie3 : Tableau;
begin
    -- Initialiser le tableau
    Tab1 := ( (1, 3, 4, 2, others => 0), 4);
    Tab2 := ( (4, 3, 2, 1, others => 0), 4);
    Tab3 := ( (-5, 3, 8, 1, -25, 0 ,8, 1, 1, 1), 10);


    -- Afficher le tableau
    Afficher (Tab1);
    New_Line;
    New_Line;

    --Trier le tableau
    Trie1 := Tri_Tableau (Tab1);
    Trie2 := Tri_Tableau (Tab2);
    Trie3 := Tri_Tableau (Tab3);
    Afficher (Trie1);
    New_Line;
    Afficher (Trie2);
    New_Line;
    Afficher (Trie3);
    New_Line;

end Tri_Selection;
