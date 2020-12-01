--file: SZBD_01_Uprawnienia_zadania.pdf

--zad 1
select * from INF141024.PRACOWNICY;

--zad 2
grant select on PRACOWNICY to INF141024;

--zad 3
select * from INF141024.PRACOWNICY;

--zad 4
grant update(placa_pod, placa_dod) on PRACOWNICY to INF141024;

--zad 5
update INF141024.PRACOWNICY p
    set p.placa_pod = p.placa_pod * 2;

update INF141024.PRACOWNICY p
    set p.placa = 2000
    where p.nazwisko = 'MORZY';

update INF141024.PRACOWNICY p
    set p.placa_pod = 700;

--zad 6
create synonym pracownicy_inf for INF141024.pracownicy;
update pracownicy_inf set placa_dod = 800;

