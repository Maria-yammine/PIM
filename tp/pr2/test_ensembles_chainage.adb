with Ensembles_Chainage;

--Programme de test du module Ensembles_Tableau
procedure Test_Ensembles_Chainage is

    package Ensemble_Characteres is
            new Ensembles_Chainage (T_Element => Character);
    use Ensemble_Characteres;

    -- Initialiser un ensemble avec M et A ajoutés dans l'ensemble vide.
    procedure Initialiser_avec_M_A (Ens : out T_Ensemble) is
    begin
        Initialiser (Ens);
        Ajouter (Ens, 'M');
        Ajouter (Ens, 'A');
    end Initialiser_avec_M_A;

    procedure Tester_Est_Vide is
        Ens1, Ens2 : T_Ensemble;
    begin
        Initialiser (Ens1);
        pragma Assert (Est_Vide (Ens1));

        Ajouter (Ens1, 'R');
        pragma Assert (not Est_Vide (Ens1));

        Detruire (Ens1);

        Initialiser_avec_M_A (Ens2);
        pragma Assert (not Est_Vide (Ens2));
	
	Detruire (Ens2);
    end Tester_Est_Vide;

    procedure Tester_Ajouter is
        Ens1 : T_Ensemble;
    begin
        Initialiser_avec_M_A (Ens1);
        pragma Assert (not Est_Vide (Ens1));
        pragma Assert (Taille (Ens1) = 2);

        Ajouter (Ens1, 'I');
        pragma Assert (Est_Present(Ens1, 'I'));
        pragma Assert (Taille (Ens1) = 3);

        Ajouter (Ens1, 'E');
        pragma Assert (Est_Present(Ens1, 'E'));
        pragma Assert (Taille (Ens1) = 4);

        Detruire (Ens1);
    end Tester_Ajouter;

    procedure Tester_Supprimer is
        Ens1 : T_Ensemble;
    begin
        Initialiser_avec_M_A (Ens1);
        Supprimer (Ens1, 'A');
        pragma Assert (not Est_Present(Ens1, 'A'));
        pragma Assert (Taille (Ens1) = 1);
        Supprimer (Ens1, 'M');
        pragma Assert (Est_Vide (Ens1));
        Detruire (Ens1);
    end Tester_Supprimer;

begin
    Tester_Est_Vide;
    Tester_Ajouter;
    Tester_Supprimer;
end Test_Ensembles_Chainage;
