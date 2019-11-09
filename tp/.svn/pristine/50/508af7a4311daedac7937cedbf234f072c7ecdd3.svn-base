-- Spécification du module Ensembles_Chainage.

generic
    type T_Element is private;  -- Type des éléments de l'ensemble

package Ensembles_Chainage is

    type T_Ensemble is limited private;

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
    function Taille (Ensemble : in T_Ensemble) return Integer;

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
            Pre => not Est_Present(Ensemble,Element),
            Post => (Taille(Ensemble) = Taille(Ensemble)'Old + 1) and Est_Present(Ensemble,Element);

    -- Supprimer un élément d'un ensemble
     -- Paramètres :
    --        Ensemble : l'ensemble qu'on veut parcourir
    --        Element : l'élément qu'on veut supprimer de l'ensemble
    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) with
            Pre => not Est_Vide (Ensemble) and Est_Present (Ensemble, Element),
            Post => not Est_Present (Ensemble, Element);

    -- Appliquer une opération sur chaque élément de l’ensemble
    generic
        with procedure Operation (Element: in T_Element);
    procedure Appliquer_Sur_Tous (Ensemble : in T_Ensemble);

private
    type T_Cellule;

    type T_Ensemble is access T_Cellule;  -- pointeur sur T_Cellule

    type T_Cellule is
        record
            Element : T_Element;   -- valeur de la cellule pointée
            Suivant: T_Ensemble;   -- pointeur sur la cellule suivante
        end record;

end Ensembles_Chainage;
