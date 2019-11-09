with Ensembles_Tableau;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Scenario_Tableau is
    -- Instancier le paquetage Ensembles_Tableau pour avoir un Ensemble
    -- d'entiers de capacité 10
    package Ensemble_Entiers is
            new Ensembles_Tableau (Capacite => 10, T_Element => Integer);
    use Ensemble_Entiers;

    -- Définir une opération Afficher qui affiche les éléments d'un ensemble
    -- d'entier en s'appuyant sur Appliquer_Sur_Tous. L'ensemble {5, 28, 10}
    -- sera affiché :
    --           5         28         10
    procedure Afficher_Entier (Entier : in out Integer) is
    begin
     Put(Entier);
    end Afficher_Entier;

    procedure Afficher is new Appliquer_Sur_Tous (Operation => Afficher_Entier);

    procedure Verification (Ens : in T_Ensemble) is
    begin
        Put ("Vide          :   ");
        Put_Line (Boolean'Image(Est_Vide(Ens)));
        Put ("Taille        :   ");
        Put_Line (Integer'Image(Taille(Ens)));
        Put ("Contient 2    :   ");
        Put_Line (Boolean'Image(Est_Present(Ens, 2)));
        Put ("Contient 5    :   ");
        Put_Line (Boolean'Image(Est_Present(Ens, 5)));
        Put ("Contient 7    :   ");
        Put_Line (Boolean'Image(Est_Present(Ens, 7)));
        Put ("Contient 10   :   ");
        Put_Line (Boolean'Image(Est_Present(Ens, 10)));
    end Verification;

    Ens1 : T_Ensemble;

begin
    -- Créer un ensemble vide Ens1
    Initialiser (Ens1);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);
    New_Line;

    -- Ajouter 5 dans Ens1
    Ajouter (Ens1, 5);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);
    New_Line;

    -- Ajouter 28 puis 10 dans Ens1
    Ajouter (Ens1, 28);
    Ajouter (Ens1, 10);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);
    New_Line;

    -- Ajouter 7 dans Ens1
    Ajouter (Ens1, 7);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);
    New_Line;

    -- Supprimer 10 en Ens1
    Supprimer (Ens1, 10);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);
    New_Line;

    -- Supprimer 7 en Ens1
    Supprimer (Ens1, 7);
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);
    New_Line;

    -- Supprimer 5 en Ens1
    Supprimer (Ens1, 5);
    -- Afficher l'ensemble
    Afficher (Ens1);
    New_Line;
    -- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
    Verification (Ens1);

    -- Détruire l'ensemble
    Detruire (Ens1);

end Scenario_Tableau;
