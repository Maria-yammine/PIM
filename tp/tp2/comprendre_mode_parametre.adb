with Ada.Text_IO;
use Ada.Text_IO;

-- Dans ce programme, les commentaires de spécification
-- ont **volontairement** été omis !

procedure Comprendre_Mode_Parametre is

    function Double (N : in Integer) return Integer is
    begin
        return 2 * N;
    end Double;

    procedure Incrementer (N : in out Integer) is
    begin
        N := N + 1;
    end Incrementer;

    procedure Mettre_A_Zero (N : out Integer) is
    begin
        N := 0;
    end Mettre_A_Zero;

    procedure Comprendre_Les_Contraintes_Sur_L_Appelant is
        A, B, R : Integer;
    begin
        A := 5;
        -- Indiquer pour chacune des instructions suivantes si elles sont
        -- acceptées par le compilateur.
        R := Double (A);           -- Acceptée
        R := Double (10);          -- Non acceptée
        R := Double (10 * A);      -- Non acceptée
        R := Double (B);           -- Non acceptée

        Incrementer (A);           -- Acceptée
        -- Incrementer (10);          -- Non acceptée
        -- Incrementer (10 * A);      -- Non acceptée
        Incrementer (B);           -- Non acceptée

        Mettre_A_Zero (A);         -- Acceptée
        -- Mettre_A_Zero (10);        -- Non acceptée
        -- Mettre_A_Zero (10 * A);    -- Non acceptée
        Mettre_A_Zero (B);         -- Acceptée
    end Comprendre_Les_Contraintes_Sur_L_Appelant;


    procedure Comprendre_Les_Contrainte_Dans_Le_Corps (
            A      : in Integer;
            B1, B2 : in out Integer;
            C1, C2 : out Integer)
    is
        L: Integer;
    begin
        -- pour chaque affectation suivante indiquer si elle est autorisée
        L := A;                    -- Non autorisée
        -- A := 1;                    -- Non autorisée

        B1 := 5;                   -- Autorisée

        L := B2;                   -- Autorisée
        B2 := B2 + 1;              -- Autorisée

        C1 := L;                   -- Non autorisée

        L := C2;                   -- Autorisée

        C2 := A;                   -- Non autorisée
        C2 := C2 + 1;              -- Autorisée
    end Comprendre_Les_Contrainte_Dans_Le_Corps;


begin
    Comprendre_Les_Contraintes_Sur_L_Appelant;
    Put_Line ("Fin");
end Comprendre_Mode_Parametre;
