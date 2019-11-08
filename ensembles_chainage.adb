-- Implantation du module Ensembles_Chainage.

with Ada.Unchecked_Deallocation;


package body Ensembles_Chainage is

    --Liberer la memoire allouée précédemment.
    procedure Free is
            new Ada.Unchecked_Deallocation (T_cellule, T_Ensemble);

    procedure Initialiser (Ensemble : out T_Ensemble) is
    begin
        Ensemble := null;
    end Initialiser;

    procedure Detruire (Ensemble : in out T_Ensemble) is
    begin
        if Ensemble /= null then
            Detruire (Ensemble.all.Suivant);
            Free (Ensemble);
        else
            null;
        end if;
    end Detruire;

    function Est_Vide (Ensemble : in T_Ensemble) return Boolean is
    begin
        return Ensemble = null;
    end Est_Vide;

    function Taille (Ensemble : in T_Ensemble) return Integer is
    begin
        if Ensemble = null then
            return 0;
        else
            return 1 + Taille (Ensemble.all.Suivant);
        end if;
    end Taille;

    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean is
        Curseur : T_Ensemble;
    begin
        Curseur := Ensemble;
        while (Curseur /= null) and then (Curseur.all.Element /= Element) loop
            Curseur := Curseur.all.Suivant;
        end loop;
        return Curseur /= null;
    end Est_Present;

    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) is
        Cellule, Curseur : T_Ensemble;
    begin
        Cellule := New T_Cellule;
        Cellule.all.Element := Element;
        Cellule.all.Suivant := null;
        if (Ensemble = null) then
            Ensemble := Cellule;
        else
            Curseur := Ensemble;
            while (Curseur.all.Suivant /= null) loop
                Curseur := Curseur.all.Suivant;
            end loop;
            Curseur.all.Suivant := Cellule;
        end if;
    end Ajouter;

    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) is
    begin
        if (Ensemble.all.Element = Element) then
                Ensemble := Ensemble.all.Suivant;
        else
            Supprimer (Ensemble.all.Suivant, Element);
        end if;
    end Supprimer;

    procedure Appliquer_Sur_Tous (Ensemble : in T_Ensemble) is
        Curseur : T_Ensemble;
    begin
        Curseur := Ensemble;
        while (Curseur /= null) loop
            Operation (Curseur.all.Element);
            Curseur := Curseur.all.Suivant;
        end loop;
    end Appliquer_Sur_Tous;

end Ensembles_Chainage;
