with Ensembles_Tableau;

--Programme de test du module Ensembles_Tableau
procedure Test_Ensembles_Tableau is

    package Ensemble_Entiers is
            new Ensembles_Tableau (Capacite => 5, T_Element => Integer);
    use Ensemble_Entiers;

    -- Initialiser un ensemble avec 12 et 54 ajoutés dans l'ensemble vide.
    procedure Initialiser_avec_12_54 (Ens : out T_Ensemble) is
    begin
        Initialiser (Ens);
        Ajouter (Ens, 12);
        Ajouter (Ens, 54);
    end Initialiser_avec_12_54;

    procedure Tester_Est_Vide is
        Ens1, Ens2 : T_Ensemble;
    begin
        Initialiser (Ens1);
        pragma Assert (Est_Vide (Ens1));

        Ajouter (Ens1, 6);
        pragma Assert (not Est_Vide (Ens1));

        Initialiser_Avec_12_54 (Ens2);
        pragma Assert (not Est_Vide (Ens2));
    end Tester_Est_Vide;

    procedure Tester_Ajouter is
        Ens1 : T_Ensemble;
    begin
        Initialiser_Avec_12_54 (Ens1);
        pragma Assert (not Est_Vide (Ens1));
        pragma Assert (Taille (Ens1) = 2);

        Ajouter (Ens1, 6);
        pragma Assert (Est_Present(Ens1, 6));
        pragma Assert (Taille (Ens1) = 3);

        Ajouter (Ens1, 98);
        pragma Assert (Est_Present(Ens1, 98));
        pragma Assert (Taille (Ens1) = 4);
    end Tester_Ajouter;

    procedure Tester_Supprimer is
        Ens1 : T_Ensemble;
    begin
        Initialiser_Avec_12_54 (Ens1);
        Supprimer (Ens1, 54);
        pragma Assert (not Est_Present(Ens1, 54));
        pragma Assert (Taille (Ens1) = 1);
        Supprimer (Ens1, 12);
        pragma Assert (Est_Vide (Ens1));
    end Tester_Supprimer;

begin
    Tester_Est_Vide;
    Tester_Ajouter;
    Tester_Supprimer;
end Test_Ensembles_Tableau;


