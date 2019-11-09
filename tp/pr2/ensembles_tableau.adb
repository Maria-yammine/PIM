-- Implantation du module Ensembles_Tableau.

package body Ensembles_Tableau is

    procedure Initialiser (Ensemble : out T_Ensemble) is
    begin
        Ensemble.Taille := 0;
    end Initialiser;

    procedure Detruire (Ensemble : in out T_Ensemble) is
    begin
        Ensemble.Taille := 0;
    end Detruire;

    function Est_Vide (Ensemble : in T_Ensemble) return Boolean is
    begin
        return Ensemble.Taille = 0;
    end Est_Vide;

    function Taille (Ensemble : in T_Ensemble) return Integer is
    begin
        return Ensemble.Taille;
    end Taille;

    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean is
        Indice : Integer;
    begin
        Indice := 1;
        while Indice <= Ensemble.Taille and then Ensemble.Elements(Indice)/= Element loop
            Indice := Indice + 1;
        end loop;
        return Indice <= Ensemble.Taille;
    end Est_Present;

    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) is
    begin
        Ensemble.Taille := Ensemble.Taille + 1;
        Ensemble.Elements (Ensemble.Taille) := Element;
    end Ajouter;

    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) is
        Indice : Integer;
    begin
        Indice := 1;
        while Indice <= Ensemble.Taille loop
           if Ensemble.Elements(Indice) = Element then
               Ensemble.Elements(Indice) := Ensemble.Elements(Ensemble.Taille);
               Ensemble.Taille := Ensemble.Taille - 1;
           else
               null;
           end if;
           Indice := Indice + 1;

        end loop;
    end Supprimer;

    procedure Appliquer_Sur_Tous (Ensemble : in out T_Ensemble) is
    begin
        for indice in 1..Ensemble.Taille loop
            Operation (Ensemble.Elements(indice));
        end loop;
    end Appliquer_Sur_Tous;

end Ensembles_Tableau;
