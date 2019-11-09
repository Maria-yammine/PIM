procedure Dates is
    
    type T_Date is 
        record
            Jour  : Integer;  -- le jour est compris entre 1 et 31
            Mois  : Integer;   -- le mois est compris entre 1 et 12
            Annee : Integer;  -- l'année est supérieure a 1
        end record;
    
    -- Fonction qui permet de déterminer si une année est bissextile
    function Est_bissextile (Annee : in Integer) return Boolean with
            Pre => Annee > 0
    is 
    begin 
        if (Annee mod 400 = 0) or (Annee mod 4 = 0 and Annee mod 100 /= 0) then
            return True;
        else 
            return False;
        end if;
    end Est_bissextile;
    
    -- Fonction qui permet de calculer le nombre de jours dans un mois
    function Nombre_de_jours (Mois, Annee : in Integer) return Integer with
            Pre => Mois >= 1 and Mois <= 12 and Annee >= 1,
            Post => Nombre_de_jours'Result >= 28 and Nombre_de_jours'Result <= 31
    is 
        Jours : Integer;     -- le nombre de jours retourné par la fonction
    begin
         Case Mois is
            when 1 | 3 | 5 | 7 | 8 | 10 | 12 
                => Jours := 31; 
            when 4 | 6 | 9 | 11              
                => Jours := 30; 
            when 2                           
                =>
                -- si l'année est bissextile
                if Est_Bissextile (Annee) then 
                    Jours := 29; -- février contient 29 jours
                -- si l'année n'est pas bissextile
                else
                    Jours := 28; -- février contient 28 jours.
                end if;
            when others => null;
        end Case;
        return Jours;
    end Nombre_de_jours;
    
    -- Fonction qui modifie une date et passe au lendemain
    function Lendemain (Date : in out T_Date) return T_Date with
            Pre => Date.Jour >= 1 and Date.Jour <= 31 and Date.Mois >= 1 and Date.Mois <= 12 and Date.Annee >= 1
    is
    begin
        -- si le nombre de jours est compris entre 1 et 28
        if Date.Jour >= 1 and Date.Jour < 28 then
            Date.Jour := Date.Jour + 1;
        
        -- si le nombre de jours est compris entre 28 et 31
        elsif Date.Jour >= 28 and Date.Jour <= 31 then
            
            -- si le jour est égal au nombre de jours
            if Date.Jour = Nombre_de_jours (Date.Mois, Date.Annee) then
                
                --si le mois concerné est décembre
                if Date.Mois = 12 then
                    Date.Jour := 1;
                    Date.Mois := 1;
                    Date.Annee := Date.Annee + 1;
                    
                -- si le mois concerné n'est pas décembre    
                else 
                    Date.Jour := 1;
                    Date.Mois := Date.Mois + 1;
                end if;
            
            -- si le jour est inférieur au nombre de jours
            else
                Date.Jour := Date.Jour + 1;
            end if;
        end if;
        return Date;
    end Lendemain;
    
    
    -- Procédure de test de Est_bissextile
    procedure tester_Est_bissextile is
    begin
        pragma Assert (not Est_bissextile (2019));
        pragma Assert (Est_bissextile (2004));
        pragma Assert (Est_bissextile (2020));
        pragma Assert (not Est_bissextile (2002));
    end tester_Est_bissextile;
    
    -- Procédure de test de Nombre_de_Jours
    procedure tester_Nombre_de_Jours is
    begin
        pragma Assert (28 = Nombre_de_jours (2, 2019));
        pragma Assert (31 = Nombre_de_jours (3, 2019));
        pragma Assert (30 = Nombre_de_jours (6, 2019));
        pragma Assert (31 = Nombre_de_jours (12, 2019));
        pragma Assert (29 = Nombre_de_jours (2, 2020));
    end tester_Nombre_de_Jours;
    
    -- Procédure de test de Lendemain
    procedure tester_Lendemain is
    Mem1, Mem2 : T_Date;
    begin
        Mem1.Jour := 29;
        Mem1.Mois := 2;
        Mem1.Annee := 2019;
        pragma Assert(Mem1 = Lendemain (Mem1));
        
        Mem1.Jour:= 13;
        Mem1.Mois := 10;
        Mem1.Annee := 2019;
        Mem2 := Mem1;
        Mem2.Jour := Mem2.Jour + 1;
        pragma Assert(Mem2 = Lendemain (Mem1));
    end tester_Lendemain;
    
begin
    tester_Nombre_de_Jours;
    tester_Est_bissextile;
    tester_Lendemain;
end Dates;
    
