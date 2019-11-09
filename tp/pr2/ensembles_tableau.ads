-- Spécification du module Ensembles_Tableau.

generic
    Capacite : Integer;         -- Nombre maximal d'éléments qu'un ensemble peut contenir
    type T_Element is private;  -- Type des éléments de l'ensemble


package Ensembles_Tableau is

    type T_Ensemble is limited private;
        --// Sur un type privé, on a droit à l'affectation (:=) et l'égalité (=).
        --// On perd ces opérations avec un type "limited private" (très privé).

    -- Initialiser un ensemble. L'ensemble est vide.
    -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut initialiser
    procedure Initialiser (Ensemble : out T_Ensemble) with
            Post => Est_Vide (Ensemble);

    -- Détruire un ensemble : libérer les ressources qu'il utilise
    -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut détruire
    procedure Detruire (Ensemble : in out T_Ensemble) with
            Post => Est_Vide (Ensemble);

    -- Est-ce que l'ensemble est vide ?
    -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut vider
    function Est_Vide (Ensemble : in T_Ensemble) return Boolean;

    -- La taille d'un ensemble
    -- Paramètres :
    --        Ensemble : l'ensemble dont on veut connaître la taille
    function Taille (Ensemble : in T_Ensemble) return Integer with
            Post => (Taille'Result >= 0) and (Taille'Result <= Capacite);

    -- Savoir si un élément est présent dans un ensemble
    -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut parcourir
    --        Element : l'élément dont on veut connaître la présence ou pas dans l'ensemble
    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean;

    -- Ajouter un élément dans un ensemble
    -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut parcourir
    --        Element : l'élément qu'on veut ajouter dans l'ensemble
    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) with
            Pre => Taille(Ensemble) < Capacite and not Est_Present(Ensemble,Element),
            Post => (Taille(Ensemble) = Taille(Ensemble)'Old + 1) and Est_Present(Ensemble,Element);

    -- Supprimer un élément d'un ensemble
     -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut parcourir
    --        Element : l'élément qu'on veut supprimer de l'ensemble
    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) with
            Pre => not Est_Vide (Ensemble),
            Post => not Est_Present(Ensemble, Element);

    -- Appliquer une opération sur chaque élément de l’ensemble
    generic
        with procedure Operation (Element: in out T_Element);
    procedure Appliquer_Sur_Tous (Ensemble : in out T_Ensemble);

private

    type T_Tab_Elements is array (1..Capacite) of T_Element;

    type T_Ensemble is
        record
            Elements : T_Tab_Elements;  -- les éléments de l'ensemble
            Taille: Integer;            -- Nombre d'éléments dans l'ensemble
        end record;


end Ensembles_Tableau;
